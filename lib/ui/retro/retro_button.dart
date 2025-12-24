import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

/// Retro-style button widget with 90's DOS aesthetic
/// 
/// This button provides authentic retro interaction patterns:
/// - **Hover**: Inverts colors (background fills with accent color)
/// - **Press**: Visual "nudge" effect (1px translate)
/// - **Outline**: Sharp bordered styling
/// 
/// **Design Philosophy:**
/// Mimics DOS-era button behavior where hover provided clear visual
/// feedback and press showed physical button depression.
/// 
/// **Accessibility:**
/// - Proper cursor indication
/// - Color-inverted hover state for visibility
/// - Tactile press feedback
/// 
/// **Usage:**
/// ```dart
/// RetroButton(
///   text: 'START',
///   onPressed: () => print('Clicked!'),
/// )
/// ```
class RetroButton extends StatefulWidget {
  /// Text displayed on the button
  final String text;
  
  /// Callback when button is pressed (null = disabled)
  final VoidCallback? onPressed;
  
  /// Internal padding around text
  final EdgeInsets padding;
  
  /// Border thickness
  final double borderWidth;
  
  /// Border and text color in default state
  final Color borderColor;
  
  /// Text color in default state
  final Color textColor;
  
  /// Background color when hovered
  final Color hoverBackgroundColor;
  
  /// Text color when hovered (inverted for contrast)
  final Color hoverTextColor;
  
  /// Font size for button text
  final double fontSize;
  
  /// Optional custom font family (defaults to theme font)
  final String? fontFamily;
  
  const RetroButton({
    super.key,
    required this.text,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.borderWidth = AppConstants.borderWidth,
    this.borderColor = AppConstants.borderColor,
    this.textColor = AppConstants.primaryTextColor,
    this.hoverBackgroundColor = AppConstants.accentColor,
    this.hoverTextColor = Colors.black,
    this.fontSize = 16,
    this.fontFamily = AppConstants.fontFamily,
  });

  @override
  State<RetroButton> createState() => _RetroButtonState();
}

/// Private state class for [RetroButton]
/// 
/// Manages hover and press states for visual feedback.
/// - [_isHovered]: True when mouse cursor is over button
/// - [_isPressed]: True when button is being pressed (mouse down)
class _RetroButtonState extends State<RetroButton> {
  /// Whether the mouse cursor is currently hovering over the button
  bool _isHovered = false;
  
  /// Whether the button is currently being pressed
  bool _isPressed = false;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onPressed != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          transform: Matrix4.identity()
            ..translate(_isPressed ? 1.0 : 0.0, _isPressed ? 1.0 : 0.0),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: _isHovered ? widget.hoverBackgroundColor : Colors.transparent,
            border: Border.all(
              color: widget.borderColor,
              width: widget.borderWidth,
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: _isHovered ? widget.hoverTextColor : widget.textColor,
              fontSize: widget.fontSize,
              fontFamily: widget.fontFamily,
              fontWeight: FontWeight.normal,
              shadows: [
                Shadow(
                  offset: const Offset(1, 1),
                  color: _isHovered ? Colors.transparent : Colors.black.withOpacity(0.8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
