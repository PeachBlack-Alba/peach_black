import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/window_entity.dart';
import 'window_management_event.dart';
import 'window_management_state.dart';

/// BLoC responsible for managing the state of all open windows
/// 
/// This BLoC handles all window-related operations including opening, closing,
/// focusing, dragging, and maintaining the z-order of windows in the portfolio.
/// 
/// **Responsibilities:**
/// - Maintain list of open windows
/// - Handle window lifecycle (open, close)
/// - Manage window focus and z-ordering
/// - Update window positions during drag operations
/// 
/// **Design Decisions:**
/// - Windows are stored in a list where order represents z-index
/// - Last window in list is the topmost/focused window
/// - Only one window can be focused at a time
/// 
/// **Usage:**
/// ```dart
/// // Open a new window
/// context.read<WindowManagementBloc>().add(OpenWindowEvent(window));
/// 
/// // Focus an existing window
/// context.read<WindowManagementBloc>().add(FocusWindowEvent('windowId'));
/// 
/// // Close a window
/// context.read<WindowManagementBloc>().add(CloseWindowEvent('windowId'));
/// ```
class WindowManagementBloc
    extends Bloc<WindowManagementEvent, WindowManagementState> {
  WindowManagementBloc() : super(const WindowManagementState()) {
    on<OpenWindowEvent>(_onOpenWindow);
    on<CloseWindowEvent>(_onCloseWindow);
    on<FocusWindowEvent>(_onFocusWindow);
    on<UpdateWindowPositionEvent>(_onUpdateWindowPosition);
    on<CloseAllWindowsEvent>(_onCloseAllWindows);
  }

  /// Opens a new window or focuses it if already open
  /// 
  /// If a window with the same ID already exists, it will be focused instead.
  void _onOpenWindow(
    OpenWindowEvent event,
    Emitter<WindowManagementState> emit,
  ) {
    final windows = List<WindowEntity>.from(state.openWindows);
    
    // Check if window is already open
    final existingIndex = windows.indexWhere((w) => w.id == event.window.id);
    
    if (existingIndex != -1) {
      // Window already exists, just focus it
      final existing = windows.removeAt(existingIndex);
      windows.add(existing.copyWith(isFocused: true));
    } else {
      // New window - unfocus all others and add this one as focused
      final unfocusedWindows = windows.map((w) => w.copyWith(isFocused: false)).toList();
      unfocusedWindows.add(event.window.copyWith(isFocused: true));
      
      emit(state.copyWith(openWindows: unfocusedWindows));
      return;
    }
    
    emit(state.copyWith(openWindows: windows));
  }

  /// Closes the specified window
  /// 
  /// Removes the window from the state. If this was the focused window,
  /// the previous window (if any) becomes focused.
  void _onCloseWindow(
    CloseWindowEvent event,
    Emitter<WindowManagementState> emit,
  ) {
    final windows = List<WindowEntity>.from(state.openWindows);
    final closedIndex = windows.indexWhere((w) => w.id == event.windowId);
    
    if (closedIndex == -1) return; // Window not found
    
    final wasLastWindow = closedIndex == windows.length - 1;
    windows.removeAt(closedIndex);
    
    // If we closed the focused window and there are others, focus the new last one
    if (wasLastWindow && windows.isNotEmpty) {
      final newLast = windows.removeLast();
      windows.add(newLast.copyWith(isFocused: true));
    }
    
    emit(state.copyWith(openWindows: windows));
  }

  /// Brings the specified window to front (focuses it)
  /// 
  /// Updates z-order by moving the window to the end of the list.
  /// All other windows are unfocused.
  void _onFocusWindow(
    FocusWindowEvent event,
    Emitter<WindowManagementState> emit,
  ) {
    final windows = List<WindowEntity>.from(state.openWindows);
    final windowIndex = windows.indexWhere((w) => w.id == event.windowId);
    
    if (windowIndex == -1) return; // Window not found
    if (windowIndex == windows.length - 1) return; // Already focused
    
    // Remove the window from its current position
    final window = windows.removeAt(windowIndex);
    
    // Unfocus all windows and add the focused one at the end
    final unfocusedWindows = windows.map((w) => w.copyWith(isFocused: false)).toList();
    unfocusedWindows.add(window.copyWith(isFocused: true));
    
    emit(state.copyWith(openWindows: unfocusedWindows));
  }

  /// Updates the position of a window after drag operation
  /// 
  /// This maintains the window's focus state and z-order while updating position.
  void _onUpdateWindowPosition(
    UpdateWindowPositionEvent event,
    Emitter<WindowManagementState> emit,
  ) {
    final windows = state.openWindows.map((window) {
      if (window.id == event.windowId) {
        return window.copyWith(position: event.newPosition);
      }
      return window;
    }).toList();
    
    emit(state.copyWith(openWindows: windows));
  }

  /// Closes all open windows
  /// 
  /// Resets the window management state to empty.
  void _onCloseAllWindows(
    CloseAllWindowsEvent event,
    Emitter<WindowManagementState> emit,
  ) {
    emit(const WindowManagementState(openWindows: []));
  }
}



