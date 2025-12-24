import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

/// Retro terminal-style blinking cursor widget
/// 
/// Displays an animated block cursor that fades in and out continuously,
/// mimicking the behavior of classic DOS and terminal text editors.
/// 
/// **Features:**
/// - Smooth fade animation (opacity-based)
/// - Configurable size and color
/// - Authentic retro aesthetic with shadow
/// - Continuous loop animation
/// 
/// **Usage:**
/// ```dart
/// Row(
///   children: [
///     TypewriterText(text: "C:\\>"),
///     BlinkingCursor(),
///   ],
/// )
/// ```
/// 
/// **Performance:**
/// Uses AnimationController with repeat for efficient animation loop.
/// Properly disposes controller to prevent memory leaks.
class BlinkingCursor extends StatefulWidget {
  /// Width of the cursor block in logical pixels
  final double width;
  
  /// Height of the cursor block in logical pixels
  final double height;
  
  /// Color of the cursor (typically accent green for retro look)
  final Color color;
  
  /// Duration of one complete blink cycle (fade in + fade out)
  final Duration blinkDuration;
  
  const BlinkingCursor({
    super.key,
    this.width = 12,
    this.height = 20,
    this.color = AppConstants.accentColor,
    this.blinkDuration = AppConstants.cursorBlinkDuration,
  });

  @override
  State<BlinkingCursor> createState() => _BlinkingCursorState();
}

/// Private state class for [BlinkingCursor]
/// 
/// Manages the opacity animation that creates the blinking effect.
/// Uses TickerProviderStateMixin for animation controller vsync.
class _BlinkingCursorState extends State<BlinkingCursor>
    with TickerProviderStateMixin {
  /// Animation controller for the blink cycle
  late AnimationController _blinkController;
  
  /// Opacity animation from 0.0 (invisible) to 1.0 (fully visible)
  late Animation<double> _blinkAnimation;
  
  @override
  void initState() {
    super.initState();
    _initializeBlinkAnimation();
  }

  /// Initializes the blink animation controller and tween
  /// 
  /// Creates a repeating animation that smoothly transitions opacity
  /// from 0 to 1 and back, creating the classic blinking cursor effect.
  void _initializeBlinkAnimation() {
    _blinkController = AnimationController(
      duration: widget.blinkDuration,
      vsync: this,
    )..repeat(reverse: true); // Continuously fade in/out
    
    _blinkAnimation = Tween<double>(
      begin: 0.0, // Fully transparent
      end: 1.0,   // Fully visible
    ).animate(
      CurvedAnimation(
        parent: _blinkController,
        curve: Curves.easeInOut, // Smooth fade
      ),
    );
  }

  @override
  void dispose() {
    // Dispose animation controller to prevent memory leaks
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
              // Retro CRT-style shadow for depth
              boxShadow: const [
                BoxShadow(
                  offset: Offset(1, 1),
                  color: Colors.black87,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
