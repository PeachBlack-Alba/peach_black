import 'package:flutter/material.dart';

/// A blinking block cursor widget for retro terminals
class BlinkingCursor extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final Duration blinkDuration;
  
  const BlinkingCursor({
    super.key,
    this.width = 12,
    this.height = 20,
    this.color = const Color(0xFF4AF626),
    this.blinkDuration = const Duration(milliseconds: 650),
  });

  @override
  State<BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<BlinkingCursor>
    with TickerProviderStateMixin {
  late AnimationController _blinkController;
  late Animation<double> _blinkAnimation;
  
  @override
  void initState() {
    super.initState();
    
    _blinkController = AnimationController(
      duration: widget.blinkDuration,
      vsync: this,
    )..repeat(reverse: true);
    
    _blinkAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _blinkController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _blinkAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _blinkAnimation.value,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1, 1),
                  color: Colors.black.withOpacity(0.8),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
