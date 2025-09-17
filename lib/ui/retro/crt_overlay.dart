import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A CRT overlay that adds scanlines, vignette, and subtle flicker effects
/// Compatible with Flutter web (no fragment shaders)
class CRTOverlay extends StatefulWidget {
  final Widget child;
  final double scanlineOpacity;
  final double vignetteOpacity;
  final double flickerIntensity;
  
  const CRTOverlay({
    super.key,
    required this.child,
    this.scanlineOpacity = 0.08,
    this.vignetteOpacity = 0.28,
    this.flickerIntensity = 0.02,
  });

  @override
  State<CRTOverlay> createState() => _CRTOverlayState();
}

class _CRTOverlayState extends State<CRTOverlay>
    with TickerProviderStateMixin {
  late AnimationController _flickerController;
  late Animation<double> _flickerAnimation;
  
  @override
  void initState() {
    super.initState();
    
    // 60Hz flicker simulation
    _flickerController = AnimationController(
      duration: const Duration(milliseconds: 16), // ~60fps
      vsync: this,
    )..repeat();
    
    _flickerAnimation = Tween<double>(
      begin: -widget.flickerIntensity,
      end: widget.flickerIntensity,
    ).animate(CurvedAnimation(
      parent: _flickerController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _flickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base content
        widget.child,
        
        // CRT effects overlay
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedBuilder(
              animation: _flickerAnimation,
              builder: (context, child) {
                return CustomPaint(
                  painter: CRTPainter(
                    scanlineOpacity: widget.scanlineOpacity,
                    vignetteOpacity: widget.vignetteOpacity,
                    flickerOffset: _flickerAnimation.value,
                  ),
                  size: Size.infinite,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CRTPainter extends CustomPainter {
  final double scanlineOpacity;
  final double vignetteOpacity;
  final double flickerOffset;
  
  CRTPainter({
    required this.scanlineOpacity,
    required this.vignetteOpacity,
    required this.flickerOffset,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    // Draw scanlines - 1px every 3-4px
    _drawScanlines(canvas, size);
    
    // Draw vignette effect
    _drawVignette(canvas, size);
    
    // Add subtle flicker overlay
    _drawFlicker(canvas, size);
  }
  
  void _drawScanlines(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(scanlineOpacity)
      ..strokeWidth = 1;
    
    // Draw horizontal scanlines every 3-4 pixels
    for (double y = 0; y < size.height; y += 4) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }
  
  void _drawVignette(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.max(size.width, size.height) * 0.8;
    
    final gradient = RadialGradient(
      center: Alignment.center,
      radius: 1.0,
      colors: [
        Colors.transparent,
        Colors.black.withOpacity(vignetteOpacity * 0.3),
        Colors.black.withOpacity(vignetteOpacity),
      ],
      stops: const [0.0, 0.7, 1.0],
    );
    
    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      );
    
    canvas.drawRect(Offset.zero & size, paint);
  }
  
  void _drawFlicker(Canvas canvas, Size size) {
    if (flickerOffset.abs() > 0.005) {
      final paint = Paint()
        ..color = Colors.white.withOpacity(flickerOffset.abs() * 0.5)
        ..blendMode = BlendMode.overlay;
      
      canvas.drawRect(Offset.zero & size, paint);
    }
  }
  
  @override
  bool shouldRepaint(CRTPainter oldDelegate) {
    return oldDelegate.flickerOffset != flickerOffset ||
        oldDelegate.scanlineOpacity != scanlineOpacity ||
        oldDelegate.vignetteOpacity != vignetteOpacity;
  }
}
