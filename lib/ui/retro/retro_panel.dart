import 'package:flutter/material.dart';

/// A retro-style panel with double white borders
class RetroPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double outerBorderWidth;
  final double innerBorderWidth;
  final Color borderColor;
  final Color backgroundColor;
  
  const RetroPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.outerBorderWidth = 2.0,
    this.innerBorderWidth = 1.0,
    this.borderColor = Colors.white,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: outerBorderWidth,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(outerBorderWidth + 2),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: innerBorderWidth,
          ),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
