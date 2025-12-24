import 'package:equatable/equatable.dart';
import '../../../domain/entities/window_entity.dart';

/// State representing the current collection of open windows
/// 
/// This state contains the complete list of all windows currently displayed
/// in the portfolio interface, ordered by z-index (last = top).
class WindowManagementState extends Equatable {
  /// List of currently open windows, ordered by z-index
  /// 
  /// Windows earlier in the list are rendered behind windows later in the list.
  /// The last window in the list is the topmost/focused window.
  final List<WindowEntity> openWindows;

  const WindowManagementState({
    this.openWindows = const [],
  });

  /// Creates a copy of this state with updated properties
  WindowManagementState copyWith({
    List<WindowEntity>? openWindows,
  }) {
    return WindowManagementState(
      openWindows: openWindows ?? this.openWindows,
    );
  }

  /// Returns the currently focused (topmost) window, if any
  WindowEntity? get focusedWindow {
    if (openWindows.isEmpty) return null;
    return openWindows.last;
  }

  /// Checks if any windows are currently open
  bool get hasOpenWindows => openWindows.isNotEmpty;

  /// Returns the number of currently open windows
  int get windowCount => openWindows.length;

  /// Finds a window by its ID
  WindowEntity? findWindowById(String id) {
    try {
      return openWindows.firstWhere((window) => window.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  List<Object?> get props => [openWindows];
}



