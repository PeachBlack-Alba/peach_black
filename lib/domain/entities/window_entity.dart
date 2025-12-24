import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Represents a draggable retro-style window in the portfolio
/// 
/// This entity encapsulates all the properties needed to render and manage
/// a window in the 90's DOS-style interface, including its position, size,
/// focus state, and content.
class WindowEntity extends Equatable {
  /// Unique identifier for the window
  final String id;
  
  /// Display title shown in the window's title bar
  final String title;
  
  /// Current position offset from the top-left corner
  final Offset position;
  
  /// Whether this window is currently focused (on top of z-stack)
  final bool isFocused;
  
  /// Widget to display as the window's content
  final Widget content;
  
  /// Optional custom icon path for the window's title bar
  final String? iconPath;
  
  /// Minimum size constraints for the window
  final Size minSize;
  
  /// Initial/current size of the window
  final Size size;

  const WindowEntity({
    required this.id,
    required this.title,
    required this.position,
    required this.content,
    this.isFocused = false,
    this.iconPath,
    this.minSize = const Size(400, 300),
    this.size = const Size(520, 360),
  });

  /// Creates a copy of this window with updated properties
  WindowEntity copyWith({
    String? id,
    String? title,
    Offset? position,
    bool? isFocused,
    Widget? content,
    String? iconPath,
    Size? minSize,
    Size? size,
  }) {
    return WindowEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      position: position ?? this.position,
      isFocused: isFocused ?? this.isFocused,
      content: content ?? this.content,
      iconPath: iconPath ?? this.iconPath,
      minSize: minSize ?? this.minSize,
      size: size ?? this.size,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        position,
        isFocused,
        iconPath,
        minSize,
        size,
      ];
}



