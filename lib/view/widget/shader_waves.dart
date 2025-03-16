import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ShaderWaves extends StatefulWidget {
  final double waveSpeed;
  final double waveFrequency;
  final double waveAmplitude;
  final Color waveColor;
  final bool enableMouseInteraction;
  final double mouseRadius;
  final int colorNum;
  final double pixelSize;
  final Widget child;

  ShaderWaves({
    required this.waveSpeed,
    required this.waveFrequency,
    required this.waveAmplitude,
    required this.waveColor,
    required this.enableMouseInteraction,
    required this.mouseRadius,
    this.colorNum = 4,
    this.pixelSize = 2.0,
    required this.child,
  });

  @override
  _ShaderWavesState createState() => _ShaderWavesState();
}

class _ShaderWavesState extends State<ShaderWaves> with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  double _time = 0.0;
  Offset? _mousePos;
  Size _size = Size.zero;
  bool _needsRepaint = true;
  int _frameSkip = 0;
  final int _maxFrameSkip = 2; // Skip frames for better performance

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((Duration elapsed) {
      // Skip frames for better performance
      _frameSkip = (_frameSkip + 1) % _maxFrameSkip;
      if (_frameSkip == 0) {
        setState(() {
          _time = elapsed.inMilliseconds / 1000.0;
          _needsRepaint = true;
        });
      }
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _updateMousePosition(Offset position) {
    if (!widget.enableMouseInteraction) return;
    setState(() {
      _mousePos = position;
      _needsRepaint = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final newSize = Size(constraints.maxWidth, constraints.maxHeight);
        if (_size != newSize) {
          _size = newSize;
          _needsRepaint = true;
        }
        
        return MouseRegion(
          onHover: (event) => _updateMousePosition(event.localPosition),
          child: Stack(
            children: [
              RepaintBoundary(
                child: CustomPaint(
                  painter: ShaderWavesPainter(
                    time: _time,
                    waveSpeed: widget.waveSpeed,
                    waveFrequency: widget.waveFrequency,
                    waveAmplitude: widget.waveAmplitude,
                    waveColor: widget.waveColor,
                    mousePos: _mousePos,
                    mouseRadius: widget.mouseRadius,
                    enableMouseInteraction: widget.enableMouseInteraction,
                    colorNum: widget.colorNum,
                    pixelSize: widget.pixelSize,
                    size: _size,
                    needsRepaint: _needsRepaint,
                  ),
                  isComplex: true,
                  willChange: true,
                ),
              ),
              widget.child,
            ],
          ),
        );
      }
    );
  }
}

class ShaderWavesPainter extends CustomPainter {
  final double time;
  final double waveSpeed;
  final double waveFrequency;
  final double waveAmplitude;
  final Color waveColor;
  final Offset? mousePos;
  final double mouseRadius;
  final bool enableMouseInteraction;
  final int colorNum;
  final double pixelSize;
  final Size size;
  final bool needsRepaint;

  // Bayer dithering matrix 8x8
  static const List<double> bayerMatrix8x8 = [
    0.0/64.0, 48.0/64.0, 12.0/64.0, 60.0/64.0,  3.0/64.0, 51.0/64.0, 15.0/64.0, 63.0/64.0,
    32.0/64.0,16.0/64.0, 44.0/64.0, 28.0/64.0, 35.0/64.0,19.0/64.0, 47.0/64.0, 31.0/64.0,
    8.0/64.0, 56.0/64.0,  4.0/64.0, 52.0/64.0, 11.0/64.0,59.0/64.0,  7.0/64.0, 55.0/64.0,
    40.0/64.0,24.0/64.0, 36.0/64.0, 20.0/64.0, 43.0/64.0,27.0/64.0, 39.0/64.0, 23.0/64.0,
    2.0/64.0, 50.0/64.0, 14.0/64.0, 62.0/64.0,  1.0/64.0,49.0/64.0, 13.0/64.0, 61.0/64.0,
    34.0/64.0,18.0/64.0, 46.0/64.0, 30.0/64.0, 33.0/64.0,17.0/64.0, 45.0/64.0, 29.0/64.0,
    10.0/64.0,58.0/64.0,  6.0/64.0, 54.0/64.0,  9.0/64.0,57.0/64.0,  5.0/64.0, 53.0/64.0,
    42.0/64.0,26.0/64.0, 38.0/64.0, 22.0/64.0, 41.0/64.0,25.0/64.0, 37.0/64.0, 21.0/64.0
  ];

  ShaderWavesPainter({
    required this.time,
    required this.waveSpeed,
    required this.waveFrequency,
    required this.waveAmplitude,
    required this.waveColor,
    required this.mousePos,
    required this.mouseRadius,
    required this.enableMouseInteraction,
    required this.colorNum,
    required this.pixelSize,
    required this.size,
    required this.needsRepaint,
  });

  // Simplex noise implementation (simplified for this example)
  double noise(double x, double y) {
    // Simple noise function based on sin
    return math.sin(x * waveFrequency + y * waveFrequency + time * waveSpeed) * 0.5 + 0.5;
  }

  // Fractional Brownian Motion
  double fbm(double x, double y) {
    double value = 0.0;
    double amplitude = 1.0;
    double frequency = waveFrequency;
    
    // Use fewer octaves for better performance
    for (int i = 0; i < 3; i++) { // Reduced from 4 to 3 for better performance
      value += amplitude * noise(x * frequency, y * frequency);
      x *= 1.9;
      y *= 1.9;
      amplitude *= waveAmplitude;
    }
    
    return value;
  }

  // Dithering function
  Color dither(double x, double y, Color color) {
    int xIndex = (x * size.width).toInt() % 8;
    int yIndex = (y * size.height).toInt() % 8;
    double threshold = bayerMatrix8x8[yIndex * 8 + xIndex] - 0.25;
    
    double r = color.red / 255.0 + threshold;
    double g = color.green / 255.0 + threshold;
    double b = color.blue / 255.0 + threshold;
    
    r = (r * (colorNum - 1)).floor() / (colorNum - 1);
    g = (g * (colorNum - 1)).floor() / (colorNum - 1);
    b = (b * (colorNum - 1)).floor() / (colorNum - 1);
    
    return Color.fromRGBO(
      (r * 255).clamp(0, 255).toInt(),
      (g * 255).clamp(0, 255).toInt(),
      (b * 255).clamp(0, 255).toInt(),
      0.3 // Reduced opacity for subtlety
    );
  }

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final paint = Paint();
    
    // Use pixelSize for better performance
    final pSize = pixelSize;
    
    // Calculate aspect ratio once
    final aspectRatio = canvasSize.width / canvasSize.height;
    
    for (double y = 0; y < canvasSize.height; y += pSize) {
      for (double x = 0; x < canvasSize.width; x += pSize) {
        // Normalize coordinates
        double nx = x / canvasSize.width - 0.5;
        double ny = y / canvasSize.height - 0.5;
        
        // Adjust for aspect ratio
        nx *= aspectRatio;
        
        // Calculate pattern value
        double f = fbm(nx, ny);
        
        // Apply mouse interaction
        if (enableMouseInteraction && mousePos != null) {
          double mx = mousePos!.dx / canvasSize.width - 0.5;
          double my = mousePos!.dy / canvasSize.height - 0.5;
          mx *= aspectRatio;
          
          double dist = math.sqrt(math.pow(nx - mx, 2) + math.pow(ny - my, 2));
          if (dist < mouseRadius) {
            f -= 0.2 * (1.0 - (dist / mouseRadius));
          }
        }
        
        // Create color with pattern value
        Color pixelColor = Color.fromRGBO(
          (waveColor.red * f).toInt(),
          (waveColor.green * f).toInt(),
          (waveColor.blue * f).toInt(),
          0.3 // Reduced opacity for subtlety
        );
        
        // Apply dithering
        Color ditheredColor = dither(x / canvasSize.width, y / canvasSize.height, pixelColor);
        paint.color = ditheredColor;
        
        // Draw pixel
        canvas.drawRect(Rect.fromLTWH(x, y, pSize, pSize), paint);
      }
    }
  }

  @override
  bool shouldRepaint(ShaderWavesPainter oldDelegate) => 
    needsRepaint ||
    oldDelegate.time != time || 
    oldDelegate.mousePos != mousePos ||
    oldDelegate.waveSpeed != waveSpeed ||
    oldDelegate.waveFrequency != waveFrequency ||
    oldDelegate.waveAmplitude != waveAmplitude;
} 