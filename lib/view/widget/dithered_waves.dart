import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DitheredWaves extends StatefulWidget {
  final double waveSpeed;
  final double waveFrequency;
  final double waveAmplitude;
  final Color waveColor;
  final bool enableMouseInteraction;
  final double mouseRadius;
  final Widget child;

  DitheredWaves({
    required this.waveSpeed,
    required this.waveFrequency,
    required this.waveAmplitude,
    required this.waveColor,
    required this.enableMouseInteraction,
    required this.mouseRadius,
    required this.child,
  });

  @override
  _DitheredWavesState createState() => _DitheredWavesState();
}

class _DitheredWavesState extends State<DitheredWaves>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  double _time = 0.0;
  Offset? _mousePos;
  int _frameSkip = 0;
  final int _maxFrameSkip = 1; // Skip every other frame for better performance

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((Duration elapsed) {
      // Skip frames for better performance
      _frameSkip = (_frameSkip + 1) % _maxFrameSkip;
      if (_frameSkip == 0) {
        setState(() {
          _time = elapsed.inMilliseconds / 1000.0;
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The dithered waves background
        Positioned.fill(
          child: RepaintBoundary(
            child: MouseRegion(
              onHover: (event) => _updateMousePosition(event.localPosition),
              onExit: (_) => setState(() => _mousePos = null),
              child: CustomPaint(
                painter: DitheredWavePainter(
                  time: _time,
                  waveSpeed: widget.waveSpeed,
                  waveFrequency: widget.waveFrequency,
                  waveAmplitude: widget.waveAmplitude,
                  waveColor: widget.waveColor,
                  mousePos: _mousePos,
                  mouseRadius: widget.mouseRadius,
                  enableMouseInteraction: widget.enableMouseInteraction,
                ),
                isComplex: true,
                willChange: true,
              ),
            ),
          ),
        ),
        // The content
        widget.child,
      ],
    );
  }
}

class DitheredWavePainter extends CustomPainter {
  final double time;
  final double waveSpeed;
  final double waveFrequency;
  final double waveAmplitude;
  final Color waveColor;
  final Offset? mousePos;
  final double mouseRadius;
  final bool enableMouseInteraction;

  DitheredWavePainter({
    required this.time,
    required this.waveSpeed,
    required this.waveFrequency,
    required this.waveAmplitude,
    required this.waveColor,
    required this.mousePos,
    required this.mouseRadius,
    required this.enableMouseInteraction,
  });

  double _fbm(double x, double y) {
    double value = 0.0;
    double amplitude = 1.0;
    double frequency = waveFrequency;
    
    // Use fewer iterations for better performance
    for (int i = 0; i < 5; i++) {
      value += amplitude * (sin(x * frequency + y * frequency + time * waveSpeed) * 0.5 + 0.5);
      x *= 1.9;
      y *= 1.9;
      amplitude *= waveAmplitude;
    }
    
    return value;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Fill the background with black first
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = Colors.black,
    );

    final paint = Paint();
    
    // Adjust pixel size based on device performance
    // Larger pixel size = better performance but lower quality
    final pixelSize = size.width > 1200 ? 8.0 : (size.width > 600 ? 10.0 : 12.0);
    
    // Pre-calculate aspect ratio
    final aspectRatio = size.width / size.height;
    
    for (double y = 0; y < size.height; y += pixelSize) {
      for (double x = 0; x < size.width; x += pixelSize) {
        // Normalize coordinates to 0-1 range
        double nx = x / size.width;
        double ny = y / size.height;
        
        // Apply aspect ratio correction
        nx = nx * aspectRatio;
        
        double f = _fbm(nx, ny);
        
        if (enableMouseInteraction && mousePos != null) {
          double mx = mousePos!.dx / size.width * aspectRatio;
          double my = mousePos!.dy / size.height;
          
          double dist = sqrt(pow(nx - mx, 2) + pow(ny - my, 2));
          if (dist < mouseRadius) {
            f -= 0.2 * (1.0 - (dist / mouseRadius));
          }
        }
        
        // Apply dithering effect
        int xIndex = (x / pixelSize).floor() % 4;
        int yIndex = (y / pixelSize).floor() % 4;
        final ditherMatrix = [
          [0.0, 8.0, 2.0, 10.0],
          [12.0, 4.0, 14.0, 6.0],
          [3.0, 11.0, 1.0, 9.0],
          [15.0, 7.0, 13.0, 5.0]
        ];
        double dither = ditherMatrix[yIndex][xIndex] / 16.0 - 0.5;
        
        // Apply dithering and clamp value
        f = (f + dither * 0.1).clamp(0.0, 1.0);
        
        paint.color = waveColor.withOpacity(f);
        canvas.drawRect(Rect.fromLTWH(x, y, pixelSize, pixelSize), paint);
      }
    }
  }

  @override
  bool shouldRepaint(DitheredWavePainter oldDelegate) => 
    oldDelegate.time != time || 
    oldDelegate.mousePos != mousePos;
} 