import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'plasma_uniforms.dart';

/// Custom painter that renders the plasma effect using a fragment shader.
/// This implementation exactly mirrors the JavaScript/OGL version uniforms.
class PlasmaPainter extends CustomPainter {
  /// The fragment shader instance.
  final ui.FragmentShader shader;
  
  /// Current time in seconds.
  final double timeSeconds;
  
  /// Device pixel ratio for proper resolution handling.
  final double devicePixelRatio;
  
  /// Plasma color (will be linearized to 0..1 range).
  final Color color;
  
  /// Animation speed multiplier.
  final double speed;
  
  /// Direction value for the current frame (+1, -1, or sin(t*0.5) for pingpong).
  final double directionValue;
  
  /// Scale/zoom factor.
  final double scale;
  
  /// Opacity multiplier (0..1).
  final double opacity;
  
  /// Current mouse/pointer position in local coordinates.
  final Offset mouse;
  
  /// Whether mouse interaction is enabled.
  final bool mouseInteractive;

  const PlasmaPainter({
    required this.shader,
    required this.timeSeconds,
    required this.devicePixelRatio,
    required this.color,
    required this.speed,
    required this.directionValue,
    required this.scale,
    required this.opacity,
    required this.mouse,
    required this.mouseInteractive,
  });

  /// Convert sRGB color to linear RGB (simple gamma 2.2 approximation).
  static List<double> _rgbLinear(Color c) {
    double srgbToLinear(int v) {
      final x = v / 255.0;
      // Simple gamma 2.2-ish is fine here
      return math.pow(x, 2.2).toDouble();
    }
    return [
      srgbToLinear(c.red),
      srgbToLinear(c.green),
      srgbToLinear(c.blue),
    ];
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Pixel resolution (like gl.drawingBufferWidth/Height in JS)
    final double w = (size.width * devicePixelRatio).clamp(1.0, double.infinity);
    final double h = (size.height * devicePixelRatio).clamp(1.0, double.infinity);

    final rgb = _rgbLinear(color);
    final useCustomColor = (color.alpha > 0) ? 1.0 : 0.0;
    final speedScaled = speed * 0.4; // Match JS scaling

    // Mouse in pixels
    final mx = mouse.dx * devicePixelRatio;
    final my = mouse.dy * devicePixelRatio;

    // Uniform packing — keep this exact order in sync with the .frag file
    // 0: iResolution.x
    shader.setFloat(PlasmaUniforms.iResolutionX, w);
    // 1: iResolution.y
    shader.setFloat(PlasmaUniforms.iResolutionY, h);
    // 2: iTime
    shader.setFloat(PlasmaUniforms.iTime, timeSeconds);

    // 3..5: uCustomColor (r,g,b)
    shader.setFloat(PlasmaUniforms.uCustomColorR, rgb[0]);
    shader.setFloat(PlasmaUniforms.uCustomColorG, rgb[1]);
    shader.setFloat(PlasmaUniforms.uCustomColorB, rgb[2]);

    // 6: uUseCustomColor
    shader.setFloat(PlasmaUniforms.uUseCustomColor, useCustomColor);

    // 7: uSpeed
    shader.setFloat(PlasmaUniforms.uSpeed, speedScaled);
    // 8: uDirection
    shader.setFloat(PlasmaUniforms.uDirection, directionValue);
    // 9: uScale
    shader.setFloat(PlasmaUniforms.uScale, scale);
    // 10: uOpacity
    shader.setFloat(PlasmaUniforms.uOpacity, opacity);

    // 11..12: uMouse (x,y)
    shader.setFloat(PlasmaUniforms.uMouseX, mx);
    shader.setFloat(PlasmaUniforms.uMouseY, my);

    // 13: uMouseInteractive
    shader.setFloat(PlasmaUniforms.uMouseInteractive, mouseInteractive ? 1.0 : 0.0);

    // Draw full-rect with no extra background (alpha comes from shader)
    final paint = Paint()..shader = shader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant PlasmaPainter oldDelegate) {
    return oldDelegate.shader != shader ||
        oldDelegate.timeSeconds != timeSeconds ||
        oldDelegate.devicePixelRatio != devicePixelRatio ||
        oldDelegate.color != color ||
        oldDelegate.speed != speed ||
        oldDelegate.directionValue != directionValue ||
        oldDelegate.scale != scale ||
        oldDelegate.opacity != opacity ||
        oldDelegate.mouse != mouse ||
        oldDelegate.mouseInteractive != mouseInteractive;
  }
}