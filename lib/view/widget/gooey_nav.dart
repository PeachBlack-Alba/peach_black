import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peach_black/controller/generalController.dart';
import 'package:peach_black/resource/colors.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class NavItem {
  final String label;
  final String prefix;
  final String hoverKey;
  final int index;

  NavItem({
    required this.label, 
    required this.prefix, 
    required this.hoverKey,
    required this.index,
  });
}

class GooeyNav extends ConsumerStatefulWidget {
  final List<NavItem> items;
  final int particleCount;
  final Duration animationDuration;
  final double minDistance;
  final double maxDistance;
  final AutoScrollController controller;
  final String Function(BuildContext) labelTranslator;

  GooeyNav({
    required this.items,
    required this.controller,
    required this.labelTranslator,
    this.particleCount = 10,
    this.animationDuration = const Duration(milliseconds: 500),
    this.minDistance = 15,
    this.maxDistance = 30,
  });

  @override
  ConsumerState<GooeyNav> createState() => _GooeyNavState();
}

class _GooeyNavState extends ConsumerState<GooeyNav> with SingleTickerProviderStateMixin {
  late int activeIndex;
  late AnimationController _controller;
  late List<Particle> particles;
  int? lastActiveIndex;
  bool hasInteracted = false;

  @override
  void initState() {
    super.initState();
    // Initialize to -1 so no tab is active initially
    activeIndex = -1;
    _controller = AnimationController(vsync: this, duration: widget.animationDuration);
    _generateParticles();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _generateParticles() {
    final random = Random();
    particles = List.generate(widget.particleCount, (index) {
      final angle = (360 / widget.particleCount) * index;
      final distance = widget.minDistance + random.nextDouble() * (widget.maxDistance - widget.minDistance);
      return Particle(
        startX: distance * cos(angle * pi / 180),
        startY: distance * sin(angle * pi / 180),
        color: AppColors().neonColor.withOpacity(0.7),
      );
    });
  }

  void _onItemTapped(int index) {
    if (index != activeIndex) {
      setState(() {
        lastActiveIndex = activeIndex;
        activeIndex = index;
        hasInteracted = true;
      });
      _controller.forward(from: 0);
      widget.controller.scrollToIndex(widget.items[index].index, preferPosition: AutoScrollPosition.begin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.items.length, (index) {
        return Consumer(
          builder: (context, ref, child) {
            String state = ref.watch(hoverProvider);
            bool isHovered = (state == widget.items[index].hoverKey);
            bool isActive = activeIndex == index && hasInteracted;
            
            return Stack(
              children: [
                if (isActive)
                  Positioned.fill(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: GooeyEffectPainter(
                            particles: particles,
                            progress: _controller.value,
                          ),
                        );
                      },
                    ),
                  ),
                InkWell(
                  onTap: () => _onItemTapped(index),
                  onHover: (bol) {
                    if (bol) {
                      ref.read(hoverProvider.notifier).state = widget.items[index].hoverKey;
                    } else {
                      ref.read(hoverProvider.notifier).state = "";
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Row(
                      children: [
                        Text(
                          widget.items[index].prefix,
                          style: TextStyle(
                            color: AppColors().neonColor,
                            fontSize: 13,
                            fontFamily: 'sfmono'
                          ),
                        ),
                        Text(
                          widget.items[index].label,
                          style: TextStyle(
                            color: isHovered || isActive
                                ? AppColors().neonColor
                                : AppColors().textColor,
                            fontSize: 13,
                            fontFamily: 'sfmono'
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        );
      }),
    );
  }
}

class Particle {
  final double startX, startY;
  final Color color;

  Particle({required this.startX, required this.startY, required this.color});
}

class GooeyEffectPainter extends CustomPainter {
  final List<Particle> particles;
  final double progress;

  GooeyEffectPainter({required this.particles, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    for (var p in particles) {
      final animatedX = p.startX * progress;
      final animatedY = p.startY * progress;
      paint.color = p.color.withOpacity(1 - progress);
      canvas.drawCircle(Offset(size.width / 2 + animatedX, size.height / 2 + animatedY), 4 * (1 - progress), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
} 