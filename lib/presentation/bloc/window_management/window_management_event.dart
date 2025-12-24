import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/window_entity.dart';

/// Base class for all window management events
/// 
/// Window management events represent user actions on windows such as
/// opening, closing, focusing, dragging, and resizing.
abstract class WindowManagementEvent extends Equatable {
  const WindowManagementEvent();

  @override
  List<Object?> get props => [];
}

/// Event to open a new window with the specified properties
/// 
/// This creates and displays a new window in the portfolio interface.
class OpenWindowEvent extends WindowManagementEvent {
  /// The window entity to open
  final WindowEntity window;

  const OpenWindowEvent(this.window);

  @override
  List<Object?> get props => [window];
}

/// Event to close an existing window
/// 
/// Removes the window from the display and internal state.
class CloseWindowEvent extends WindowManagementEvent {
  /// ID of the window to close
  final String windowId;

  const CloseWindowEvent(this.windowId);

  @override
  List<Object?> get props => [windowId];
}

/// Event to bring a window to front (focus it)
/// 
/// Updates the z-order so this window appears on top of others.
class FocusWindowEvent extends WindowManagementEvent {
  /// ID of the window to focus
  final String windowId;

  const FocusWindowEvent(this.windowId);

  @override
  List<Object?> get props => [windowId];
}

/// Event to update a window's position after drag
/// 
/// Updates the window's offset to reflect its new screen position.
class UpdateWindowPositionEvent extends WindowManagementEvent {
  /// ID of the window to move
  final String windowId;
  
  /// New position offset
  final Offset newPosition;

  const UpdateWindowPositionEvent(this.windowId, this.newPosition);

  @override
  List<Object?> get props => [windowId, newPosition];
}

/// Event to close all open windows
/// 
/// Useful for reset or cleanup scenarios.
class CloseAllWindowsEvent extends WindowManagementEvent {
  const CloseAllWindowsEvent();
}



