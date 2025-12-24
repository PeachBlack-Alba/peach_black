import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

/// BLoC responsible for managing navigation flow in the application
/// 
/// This BLoC handles transitions between the start screen and portfolio screen,
/// including managing animation states during transitions.
/// 
/// **Responsibilities:**
/// - Handle navigation events (navigate to portfolio, back to start)
/// - Manage transition animations
/// - Emit appropriate states for UI to react to
/// 
/// **Usage:**
/// ```dart
/// context.read<NavigationBloc>().add(const NavigateToPortfolioEvent());
/// ```
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationStartState()) {
    // Handle navigation to portfolio
    on<NavigateToPortfolioEvent>(_onNavigateToPortfolio);
    
    // Handle navigation back to start
    on<NavigateToStartEvent>(_onNavigateToStart);
  }

  /// Handles the transition to portfolio screen
  /// 
  /// Emits transitioning state and then final portfolio state.
  /// This allows UI to show smooth animations.
  Future<void> _onNavigateToPortfolio(
    NavigateToPortfolioEvent event,
    Emitter<NavigationState> emit,
  ) async {
    // Start transition
    emit(const NavigationTransitioningState(0.0));
    
    // Simulate transition duration (actual animation handled by UI)
    await Future.delayed(const Duration(milliseconds: 1500));
    
    // Complete transition
    emit(const NavigationPortfolioState());
  }

  /// Handles the transition back to start screen
  /// 
  /// This can be extended in the future for logout or reset functionality.
  Future<void> _onNavigateToStart(
    NavigateToStartEvent event,
    Emitter<NavigationState> emit,
  ) async {
    emit(const NavigationStartState());
  }
}



