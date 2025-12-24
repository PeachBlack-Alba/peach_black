import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../core/constants/app_constants.dart';

/// CRT (Cathode Ray Tube) screen overlay effect widget
/// 
/// Adds authentic retro monitor effects over any content:
/// - **Scanlines**: Horizontal lines mimicking CRT electron beam
/// - **Vignette**: Darkened edges like curved CRT screens
/// - **Flicker**: Subtle brightness variations at ~60Hz
/// 
/// **Compatibility:**
/// Uses CustomPainter (Canvas API) instead of fragment shaders,
/// making it fully compatible with Flutter web and all platforms.
/// 
/// **Performance:**
/// - Runs at 60fps with AnimationController
/// - Uses IgnorePointer to allow interaction with content below
/// - Efficiently repaints only when flicker value changes
/// 
/// **Usage:**
/// ```dart
/// CRTOverlay(
///   child: YourContent(),
/// )
/// ```
/// 
/// **Historical Context:**
/// Recreates the visual characteristics of 80s-90s CRT monitors
/// used with DOS systems, adding authenticity to the retro aesthetic.
class CRTOverlay extends StatefulWidget {
  /// Content to display with CRT effects applied
  final Widget child;
  
  /// Opacity of horizontal scanlines (0.0 = invisible, 1.0 = fully opaque)
  final double scanlineOpacity;
  
  /// Opacity of vignette darkening at edges
  final double vignetteOpacity;
  
  /// Intensity of brightness flicker effect
  final double flickerIntensity;
  
  const CRTOverlay({
    super.key,
    required this.child,
    this.scanlineOpacity = AppConstants.scanlineOpacity,
    this.vignetteOpacity = AppConstants.vignetteOpacity,
    this.flickerIntensity = AppConstants.crtFlickerIntensity,
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
    
    // 60Hz flicker simulation (~60fps CRT refresh rate)
    _flickerController = AnimationController(
      duration: AppConstants.crtFlickerDuration,
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

/// Custom painter for CRT screen effects
/// 
/// Draws three visual layers:
/// 1. **Scanlines**: Horizontal dark lines every 4px
/// 2. **Vignette**: Radial gradient darkening at edges
/// 3. **Flicker**: Subtle white overlay varying with flicker animation
/// 
/// **Performance:**
/// Only repaints when flicker offset changes (60 times per second).
/// Scanlines and vignette are efficiently drawn using Canvas primitives.
class CRTPainter extends CustomPainter {
  /// Opacity of scanline effect
  final double scanlineOpacity;
  
  /// Opacity of vignette effect
  final double vignetteOpacity;
  
  /// Current flicker offset value from animation (-intensity to +intensity)
  final double flickerOffset;
  
  CRTPainter({
    required this.scanlineOpacity,
    required this.vignetteOpacity,
    required this.flickerOffset,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    _drawScanlines(canvas, size);
    _drawVignette(canvas, size);
    _drawFlicker(canvas, size);
  }
  
  /// Draws horizontal scanlines across the screen
  /// 
  /// Scanlines simulate the horizontal electron beam traces on CRT monitors.
  /// Drawn as 1px black lines with configurable spacing and opacity.
  void _drawScanlines(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(scanlineOpacity)
      ..strokeWidth = 1;
    
    // Draw horizontal line every N pixels (defined by spacing constant)
    for (double y = 0; y < size.height; y += AppConstants.scanlineSpacing) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }
  
  /// Draws radial gradient vignette effect
  /// 
  /// Creates darkening at screen edges, mimicking the curved glass
  /// and electron beam falloff of CRT monitors.
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
  
  /// Draws subtle brightness flicker overlay
  /// 
  /// Simulates the slight brightness variations in CRT displays caused by
  /// power fluctuations and electron beam instability. Uses overlay blend
  /// mode for subtle white layer that varies with animation.
  /// 
  /// Only draws if flicker is significant enough to be visible.
  void _drawFlicker(Canvas canvas, Size size) {
    if (flickerOffset.abs() > 0.005) {
      final paint = Paint()
        ..color = Colors.white.withOpacity(flickerOffset.abs() * 0.5)
        ..blendMode = BlendMode.overlay; // Subtle brightness adjustment
      
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
