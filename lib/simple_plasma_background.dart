import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A simplified plasma background that uses Flutter's built-in animation
/// as a fallback when shaders aren't available or for debugging.
class SimplePlasmaBackground extends StatefulWidget {
  final Color color;
  final double speed;
  final double opacity;

  const SimplePlasmaBackground({
    super.key,
    this.color = const Color(0xFF6B46C1),
    this.speed = 1.0,
    this.opacity = 0.8,
  });

  @override
  State<SimplePlasmaBackground> createState() => _SimplePlasmaBackgroundState();
}

class _SimplePlasmaBackgroundState extends State<SimplePlasmaBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();
    
    _controller1 = AnimationController(
      duration: Duration(milliseconds: (3000 / widget.speed).round()),
      vsync: this,
    )..repeat();
    
    _controller2 = AnimationController(
      duration: Duration(milliseconds: (4000 / widget.speed).round()),
      vsync: this,
    )..repeat();
    
    _controller3 = AnimationController(
      duration: Duration(milliseconds: (5000 / widget.speed).round()),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_controller1, _controller2, _controller3]),
      builder: (context, child) {
        return CustomPaint(
          painter: SimplePlasmaPainter(
            time1: _controller1.value,
            time2: _controller2.value,
            time3: _controller3.value,
            color: widget.color,
            opacity: widget.opacity,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class SimplePlasmaPainter extends CustomPainter {
  final double time1;
  final double time2;
  final double time3;
  final Color color;
  final double opacity;

  SimplePlasmaPainter({
    required this.time1,
    required this.time2,
    required this.time3,
    required this.color,
    required this.opacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    
    // Create multiple gradients that move and blend
    final gradient1 = RadialGradient(
      center: Alignment(
        math.sin(time1 * 2 * math.pi) * 0.5,
        math.cos(time1 * 2 * math.pi) * 0.5,
      ),
      radius: 1.0 + math.sin(time1 * 4 * math.pi) * 0.3,
      colors: [
        color.withValues(alpha: opacity * 0.8),
        color.withValues(alpha: opacity * 0.4),
        color.withValues(alpha: 0.0),
      ],
      stops: const [0.0, 0.5, 1.0],
    );
    
    final gradient2 = RadialGradient(
      center: Alignment(
        math.sin(time2 * 2 * math.pi + math.pi / 3) * 0.6,
        math.cos(time2 * 2 * math.pi + math.pi / 3) * 0.6,
      ),
      radius: 1.2 + math.sin(time2 * 3 * math.pi) * 0.4,
      colors: [
        color.withValues(alpha: opacity * 0.6),
        color.withValues(alpha: opacity * 0.3),
        color.withValues(alpha: 0.0),
      ],
      stops: const [0.0, 0.6, 1.0],
    );
    
    final gradient3 = RadialGradient(
      center: Alignment(
        math.sin(time3 * 2 * math.pi + math.pi / 2) * 0.4,
        math.cos(time3 * 2 * math.pi + math.pi / 2) * 0.4,
      ),
      radius: 0.8 + math.sin(time3 * 5 * math.pi) * 0.2,
      colors: [
        color.withValues(alpha: opacity * 0.9),
        color.withValues(alpha: opacity * 0.5),
        color.withValues(alpha: 0.0),
      ],
      stops: const [0.0, 0.4, 1.0],
    );
    
    // Draw the gradients with blend modes (no black background to let alpha blend naturally)
    canvas.drawRect(
      rect,
      Paint()
        ..shader = gradient1.createShader(rect)
        ..blendMode = BlendMode.screen,
    );
    
    canvas.drawRect(
      rect,
      Paint()
        ..shader = gradient2.createShader(rect)
        ..blendMode = BlendMode.screen,
    );
    
    canvas.drawRect(
      rect,
      Paint()
        ..shader = gradient3.createShader(rect)
        ..blendMode = BlendMode.screen,
    );
  }

  @override
  bool shouldRepaint(SimplePlasmaPainter oldDelegate) {
    return oldDelegate.time1 != time1 ||
        oldDelegate.time2 != time2 ||
        oldDelegate.time3 != time3 ||
        oldDelegate.color != color ||
        oldDelegate.opacity != opacity;
  }
}