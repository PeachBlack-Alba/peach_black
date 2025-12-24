import 'package:equatable/equatable.dart';

/// Base class for all navigation states
/// 
/// Navigation states represent the current screen/route being displayed
/// in the application's navigation flow.
abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object?> get props => [];
}

/// Initial state - showing the start/boot screen
/// 
/// This is the entry point of the application where users see
/// the DOS-style boot sequence and START button.
class NavigationStartState extends NavigationState {
  const NavigationStartState();
}

/// Transitioning state - animation in progress
/// 
/// This state represents the transition animation between screens.
/// [progress] ranges from 0.0 (start) to 1.0 (complete).
class NavigationTransitioningState extends NavigationState {
  /// Animation progress from 0.0 to 1.0
  final double progress;

  const NavigationTransitioningState(this.progress);

  @override
  List<Object?> get props => [progress];
}

/// Portfolio state - showing the main portfolio interface
/// 
/// This is the main screen where users interact with windows,
/// view content, and play retro games.
class NavigationPortfolioState extends NavigationState {
  const NavigationPortfolioState();
}



