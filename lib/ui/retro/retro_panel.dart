import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

/// Retro-style panel widget with double border design
/// 
/// Creates an authentic 90's DOS-style panel with nested double borders,
/// commonly seen in dialog boxes and content sections of old software.
/// 
/// **Visual Design:**
/// ```
/// ┌─────────────────┐  ← Outer border (thick)
/// │ ┌─────────────┐ │  ← Inner border (thin)
/// │ │   Content   │ │
/// │ └─────────────┘ │
/// └─────────────────┘
/// ```
/// 
/// **Features:**
/// - Double-border retro aesthetic
/// - Configurable border widths and colors
/// - Optional background color
/// - Flexible padding
/// 
/// **Usage:**
/// ```dart
/// RetroPanel(
///   child: Text('Welcome to DOS'),
///   padding: EdgeInsets.all(20),
/// )
/// ```
/// 
/// **Design Philosophy:**
/// Follows the "box-in-box" design pattern common in 90's UI frameworks
/// like Turbo Vision and early Windows interfaces.
class RetroPanel extends StatelessWidget {
  /// Content to display inside the panel
  final Widget child;
  
  /// Internal padding around the child content
  final EdgeInsets padding;
  
  /// Width of the outer border
  final double outerBorderWidth;
  
  /// Width of the inner border
  final double innerBorderWidth;
  
  /// Color for both borders
  final Color borderColor;
  
  /// Background color of the panel (defaults to transparent)
  final Color backgroundColor;
  
  const RetroPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppConstants.spacingLarge),
    this.outerBorderWidth = AppConstants.borderWidth,
    this.innerBorderWidth = AppConstants.innerBorderWidth,
    this.borderColor = AppConstants.borderColor,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Outer container with background and thick border
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: outerBorderWidth,
        ),
      ),
      child: Container(
        // Inner container with thin border, offset by margin
        margin: EdgeInsets.all(outerBorderWidth + 2),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: innerBorderWidth,
          ),
        ),
        // Content with padding
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
