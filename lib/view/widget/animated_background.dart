import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  final Color color;
  final Widget child;
  final bool enableMouseInteraction;

  const AnimatedBackground({
    Key? key,
    required this.color,
    required this.child,
    this.enableMouseInteraction = true,
  }) : super(key: key);

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Offset? _mousePosition;
  final List<Particle> _particles = [];
  final int _particleCount = 30; // Reduced for better performance
  final double _maxRadius = 80.0;
  Size _size = Size.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Initialize particles
    _initializeParticles();
  }

  void _initializeParticles() {
    _particles.clear();
    final random = math.Random();
    for (int i = 0; i < _particleCount; i++) {
      _particles.add(
        Particle(
          position: Offset(random.nextDouble(), random.nextDouble()),
          speed: Offset(
            (random.nextDouble() - 0.5) * 0.01, // Slower speed
            (random.nextDouble() - 0.5) * 0.01,
          ),
          radius: random.nextDouble() * 1.5 + 0.5, // Smaller particles
          color: widget.color.withOpacity(random.nextDouble() * 0.15 + 0.05), // More subtle
        ),
      );
    }
  }

  @override
  void didUpdateWidget(AnimatedBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.color != widget.color) {
      // Update particle colors if the color changes
      for (var particle in _particles) {
        final random = math.Random();
        particle.color = widget.color.withOpacity(random.nextDouble() * 0.15 + 0.05);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateMousePosition(Offset position, Size size) {
    if (!widget.enableMouseInteraction) return;
    setState(() {
      _mousePosition = Offset(
        position.dx / size.width,
        position.dy / size.height,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final newSize = Size(constraints.maxWidth, constraints.maxHeight);
        if (_size != newSize) {
          _size = newSize;
        }
        
        return MouseRegion(
          onHover: (event) => _updateMousePosition(event.localPosition, _size),
          onExit: (_) => setState(() => _mousePosition = null),
          child: Stack(
            children: [
              // Dark background
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              // Animated particles
              RepaintBoundary(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    _updateParticles();
                    return CustomPaint(
                      painter: ParticlePainter(
                        particles: _particles,
                        mousePosition: _mousePosition,
                        maxRadius: _maxRadius,
                        color: widget.color,
                      ),
                      size: _size,
                    );
                  },
                ),
              ),
              // Content
              widget.child,
            ],
          ),
        );
      },
    );
  }

  void _updateParticles() {
    for (var particle in _particles) {
      particle.position += particle.speed;
      
      // Wrap around edges
      if (particle.position.dx < 0) particle.position = Offset(1, particle.position.dy);
      if (particle.position.dx > 1) particle.position = Offset(0, particle.position.dy);
      if (particle.position.dy < 0) particle.position = Offset(particle.position.dx, 1);
      if (particle.position.dy > 1) particle.position = Offset(particle.position.dx, 0);
      
      // Apply mouse interaction
      if (_mousePosition != null && widget.enableMouseInteraction) {
        final distance = (_mousePosition! - particle.position).distance;
        if (distance < 0.2) {
          final angle = math.atan2(
            particle.position.dy - _mousePosition!.dy,
            particle.position.dx - _mousePosition!.dx,
          );
          particle.speed += Offset(
            math.cos(angle) * 0.0003 / (distance + 0.01),
            math.sin(angle) * 0.0003 / (distance + 0.01),
          );
        }
      }
      
      // Limit speed
      if (particle.speed.distance > 0.02) {
        particle.speed = Offset(
          particle.speed.dx * 0.95,
          particle.speed.dy * 0.95,
        );
      }
    }
  }
}

class Particle {
  Offset position;
  Offset speed;
  double radius;
  Color color;

  Particle({
    required this.position,
    required this.speed,
    required this.radius,
    required this.color,
  });
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final Offset? mousePosition;
  final double maxRadius;
  final Color color;

  ParticlePainter({
    required this.particles,
    required this.mousePosition,
    required this.maxRadius,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    // Draw particles
    for (var particle in particles) {
      paint.color = particle.color;
      canvas.drawCircle(
        Offset(
          particle.position.dx * size.width,
          particle.position.dy * size.height,
        ),
        particle.radius,
        paint,
      );
    }

    // Draw connections between particles
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 0.5;

    for (int i = 0; i < particles.length; i++) {
      for (int j = i + 1; j < particles.length; j++) {
        final distance = (particles[i].position - particles[j].position).distance;
        if (distance < 0.15) {
          paint.color = color.withOpacity((1 - distance / 0.15) * 0.15);
          canvas.drawLine(
            Offset(
              particles[i].position.dx * size.width,
              particles[i].position.dy * size.height,
            ),
            Offset(
              particles[j].position.dx * size.width,
              particles[j].position.dy * size.height,
            ),
            paint,
          );
        }
      }
    }

    // Draw mouse interaction area
    if (mousePosition != null) {
      final gradient = RadialGradient(
        colors: [
          color.withOpacity(0.08),
          color.withOpacity(0.0),
        ],
      );

      final rect = Rect.fromCircle(
        center: Offset(
          mousePosition!.dx * size.width,
          mousePosition!.dy * size.height,
        ),
        radius: maxRadius,
      );

      paint
        ..style = PaintingStyle.fill
        ..shader = gradient.createShader(rect);

      canvas.drawCircle(
        Offset(
          mousePosition!.dx * size.width,
          mousePosition!.dy * size.height,
        ),
        maxRadius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => true;
} 