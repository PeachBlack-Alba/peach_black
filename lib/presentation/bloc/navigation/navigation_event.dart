import 'package:equatable/equatable.dart';

/// Base class for all navigation events in the application
/// 
/// Navigation events represent user actions that trigger transitions
/// between different screens (Start Screen → Portfolio Screen).
abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when user wants to start/enter the portfolio
/// 
/// This initiates the transition animation from the start screen
/// to the main portfolio interface.
class NavigateToPortfolioEvent extends NavigationEvent {
  const NavigateToPortfolioEvent();
}

/// Event triggered to reset navigation back to start screen
/// 
/// This can be used for logout or reset functionality.
class NavigateToStartEvent extends NavigationEvent {
  const NavigateToStartEvent();
}



