import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Enum representing different types of windows in the portfolio
/// 
/// Each window type corresponds to a specific content section.
enum WindowType {
  /// About Me window - personal information
  about,
  
  /// Work/Experience window - professional history
  work,
  
  /// Contact window - contact information and links
  contact,
  
  /// DOOM game window - playable retro game
  doom,
}

/// State representing the collection of currently open windows
/// 
/// This is a legacy Cubit-based state management that will be migrated
/// to the new BLoC-based WindowManagementBloc in the presentation layer.
/// 
/// **Note:** This file exists for backward compatibility during the
/// architecture migration. New code should use WindowManagementBloc instead.
class WindowManagerState extends Equatable {
  const WindowManagerState({this.openWindows = const []});

  /// List of currently open window types
  final List<WindowType> openWindows;

  /// Checks if a window of the given type is currently open
  bool isOpen(WindowType type) => openWindows.contains(type);

  /// Creates a copy of this state with updated properties
  WindowManagerState copyWith({List<WindowType>? openWindows}) {
    return WindowManagerState(openWindows: openWindows ?? this.openWindows);
  }

  @override
  List<Object?> get props => [openWindows];
}

/// Legacy Cubit for managing window state
/// 
/// **DEPRECATED:** This Cubit will be replaced by WindowManagementBloc
/// in the presentation layer as part of the CLEAN architecture migration.
/// 
/// **Responsibilities:**
/// - Track which windows are currently open
/// - Handle open/close operations for windows
/// 
/// **Migration Path:**
/// Use `WindowManagementBloc` from `lib/presentation/bloc/window_management/`
/// for new code instead of this Cubit.
class WindowManagerCubit extends Cubit<WindowManagerState> {
  WindowManagerCubit() : super(const WindowManagerState());

  /// Opens a window of the specified type
  /// 
  /// If the window is already open, this method does nothing.
  void open(WindowType type) {
    if (state.isOpen(type)) return;
    emit(state.copyWith(openWindows: [...state.openWindows, type]));
  }

  /// Closes a window of the specified type
  /// 
  /// Renamed from `close` to `closeWindow` to avoid conflict with BlocBase.close
  void closeWindow(WindowType type) {
    emit(state.copyWith(
      openWindows: state.openWindows.where((t) => t != type).toList(),
    ));
  }
}

