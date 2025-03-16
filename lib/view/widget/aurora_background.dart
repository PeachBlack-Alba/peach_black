import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Aurora extends StatefulWidget {
  final List<Color> colorStops;
  final double blend;
  final double amplitude;
  final double speed;
  final Widget child;

  const Aurora({
    Key? key,
    required this.colorStops,
    this.blend = 0.5,
    this.amplitude = 1.0,
    this.speed = 0.5,
    required this.child,
  }) : super(key: key);

  @override
  _AuroraState createState() => _AuroraState();
}

class _AuroraState extends State<Aurora> with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  double _time = 0.0;
  int _frameSkip = 0;
  final int _maxFrameSkip = 1; // Skip frames for better performance

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The aurora background
        Positioned.fill(
          child: RepaintBoundary(
            child: CustomPaint(
              painter: AuroraPainter(
                time: _time,
                colorStops: widget.colorStops,
                blend: widget.blend,
                amplitude: widget.amplitude,
                speed: widget.speed,
              ),
              isComplex: true,
              willChange: true,
            ),
          ),
        ),
        // The content
        widget.child,
      ],
    );
  }
}

class AuroraPainter extends CustomPainter {
  final double time;
  final List<Color> colorStops;
  final double blend;
  final double amplitude;
  final double speed;

  AuroraPainter({
    required this.time,
    required this.colorStops,
    required this.blend,
    required this.amplitude,
    required this.speed,
  });

  // Simplex noise implementation (similar to snoise in GLSL)
  double _noise(double x, double y) {
    // Constants for simplex noise
    const double F2 = 0.366025403; // 0.5 * (sqrt(3) - 1)
    const double G2 = 0.211324865; // (3 - sqrt(3)) / 6

    // Skew the input space to determine which simplex cell we're in
    double s = (x + y) * F2;
    double xs = x + s;
    double ys = y + s;
    int i = xs.floor();
    int j = ys.floor();

    double t = (i + j) * G2;
    double X0 = i - t; // Unskew the cell origin back to (x,y) space
    double Y0 = j - t;
    double x0 = x - X0; // The x,y distances from the cell origin
    double y0 = y - Y0;

    // Determine which simplex we are in
    int i1, j1;
    if (x0 > y0) {
      i1 = 1;
      j1 = 0;
    } else {
      i1 = 0;
      j1 = 1;
    }

    // Offsets for corners
    double x1 = x0 - i1 + G2;
    double y1 = y0 - j1 + G2;
    double x2 = x0 - 1.0 + 2.0 * G2;
    double y2 = y0 - 1.0 + 2.0 * G2;

    // Calculate the contribution from the three corners
    double n0, n1, n2;

    // Corner 1
    double t0 = 0.5 - x0 * x0 - y0 * y0;
    if (t0 < 0) {
      n0 = 0.0;
    } else {
      t0 *= t0;
      n0 = t0 * t0 * _grad(i, j, x0, y0);
    }

    // Corner 2
    double t1 = 0.5 - x1 * x1 - y1 * y1;
    if (t1 < 0) {
      n1 = 0.0;
    } else {
      t1 *= t1;
      n1 = t1 * t1 * _grad(i + i1, j + j1, x1, y1);
    }

    // Corner 3
    double t2 = 0.5 - x2 * x2 - y2 * y2;
    if (t2 < 0) {
      n2 = 0.0;
    } else {
      t2 *= t2;
      n2 = t2 * t2 * _grad(i + 1, j + 1, x2, y2);
    }

    // Add contributions from each corner to get the final noise value
    // The result is scaled to return values in the interval [-1, 1]
    return 70.0 * (n0 + n1 + n2);
  }

  double _grad(int hash, int i, double x, double y) {
    // Convert low 4 bits of hash code into 12 gradient directions
    int h = hash & 7;
    double u = h < 4 ? x : y;
    double v = h < 4 ? y : x;
    return ((h & 1) != 0 ? -u : u) + ((h & 2) != 0 ? -2.0 * v : 2.0 * v);
  }

  Color _getColorFromGradient(double position) {
    // Ensure position is between 0 and 1
    position = position.clamp(0.0, 1.0);
    
    // Find the color stops that our position falls between
    int index = 0;
    for (int i = 0; i < colorStops.length - 1; i++) {
      double currentPosition = i / (colorStops.length - 1);
      if (currentPosition <= position) {
        index = i;
      }
    }
    
    // Get the current and next color
    Color currentColor = colorStops[index];
    Color nextColor = colorStops[min(index + 1, colorStops.length - 1)];
    
    // Calculate the range and lerp factor
    double currentPosition = index / (colorStops.length - 1);
    double nextPosition = min(index + 1, colorStops.length - 1) / (colorStops.length - 1);
    double range = nextPosition - currentPosition;
    double lerpFactor = range > 0 ? (position - currentPosition) / range : 0;
    
    // Interpolate between the colors
    return Color.lerp(currentColor, nextColor, lerpFactor)!;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Fill the background with black first
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = Colors.black,
    );

    // Use a higher resolution for better quality but not too high to maintain performance
    final resolution = size.width > 1200 ? 1.5 : 1.0;
    final pixelSize = size.width > 1200 ? 6.0 / resolution : 
                     (size.width > 600 ? 8.0 / resolution : 10.0 / resolution);
    
    // Pre-calculate aspect ratio
    final aspectRatio = size.width / size.height;
    
    // Draw the aurora effect
    final paint = Paint()..blendMode = BlendMode.srcOver;
    
    // Draw the base gradient first for better visibility
    final gradientRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final baseGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: colorStops,
      stops: [0.0, 0.5, 1.0],
    );
    
    canvas.drawRect(
      gradientRect,
      Paint()..shader = baseGradient.createShader(gradientRect)..color = Colors.black.withOpacity(0.2),
    );
    
    for (double y = 0; y < size.height; y += pixelSize) {
      for (double x = 0; x < size.width; x += pixelSize) {
        // Normalize coordinates to 0-1 range
        double nx = x / size.width;
        double ny = y / size.height;
        
        // Get color from gradient based on x position
        Color rampColor = _getColorFromGradient(nx);
        
        // Calculate noise value for aurora effect
        double noiseValue = _noise(
          nx * 2.0 + time * 0.1 * speed, 
          time * 0.25 * speed
        ) * 0.5 * amplitude;
        
        // Apply exponential function similar to GLSL shader
        double height = exp(noiseValue);
        height = (ny * 2.0 - height + 0.2);
        
        // Increase intensity for better visibility
        double intensity = 0.8 * height;
        
        // Calculate alpha using smoothstep with adjusted midpoint for more visible aurora
        double midPoint = 0.15; // Lower value to make aurora more visible
        double auroraAlpha = _smoothstep(
          midPoint - blend * 0.5, 
          midPoint + blend * 0.5, 
          intensity
        );
        
        // Boost alpha for better visibility
        auroraAlpha = pow(auroraAlpha, 0.8).toDouble(); // Less aggressive falloff
        
        // Calculate final color with boosted intensity
        Color auroraColor = Color.fromRGBO(
          (intensity * 1.5 * rampColor.red).round().clamp(0, 255),
          (intensity * 1.5 * rampColor.green).round().clamp(0, 255),
          (intensity * 1.5 * rampColor.blue).round().clamp(0, 255),
          1.0
        );
        
        // Apply premultiplied alpha with higher base opacity
        paint.color = auroraColor.withOpacity(auroraAlpha * 0.9);
        canvas.drawRect(Rect.fromLTWH(x, y, pixelSize, pixelSize), paint);
      }
    }
    
    // Add a subtle bloom effect
    final bloomPaint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30.0)
      ..blendMode = BlendMode.plus;
      
    // Draw bloom for each color stop
    for (int i = 0; i < colorStops.length; i++) {
      final position = i / (colorStops.length - 1);
      final xPos = position * size.width;
      final yPos = size.height * 0.4; // Position in upper part of screen
      
      bloomPaint.color = colorStops[i].withOpacity(0.3);
      canvas.drawCircle(Offset(xPos, yPos), size.width * 0.15, bloomPaint);
    }
  }

  // GLSL smoothstep equivalent
  double _smoothstep(double edge0, double edge1, double x) {
    // Scale, bias and saturate x to 0..1 range
    x = ((x - edge0) / (edge1 - edge0)).clamp(0.0, 1.0);
    // Evaluate polynomial
    return x * x * (3 - 2 * x);
  }

  @override
  bool shouldRepaint(AuroraPainter oldDelegate) => 
    oldDelegate.time != time || 
    oldDelegate.colorStops != colorStops ||
    oldDelegate.blend != blend ||
    oldDelegate.amplitude != amplitude ||
    oldDelegate.speed != speed;
} 