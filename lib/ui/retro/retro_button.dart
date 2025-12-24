import 'package:flutter/material.dart';

/// A retro-style button with outlined styling, hover invert, and press nudge effect
class RetroButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsets padding;
  final double borderWidth;
  final Color borderColor;
  final Color textColor;
  final Color hoverBackgroundColor;
  final Color hoverTextColor;
  final double fontSize;
  final String? fontFamily;
  
  const RetroButton({
    super.key,
    required this.text,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.borderWidth = 2.0,
    this.borderColor = Colors.white,
    this.textColor = Colors.white,
    this.hoverBackgroundColor = const Color(0xFF4AF626),
    this.hoverTextColor = Colors.black,
    this.fontSize = 16,
    this.fontFamily,
  });

  @override
  State<RetroButton> createState() => _RetroButtonState();
}

class _RetroButtonState extends State<RetroButton> {
  bool _isHovered = false;
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
