import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/navigation/navigation_bloc.dart';
import '../bloc/navigation/navigation_event.dart';
import '../bloc/navigation/navigation_state.dart';
import 'portfolio_page.dart';
import 'start_page.dart';

/// Main page that manages navigation between start and portfolio screens
/// 
/// This page listens to [NavigationBloc] state changes and renders
/// the appropriate screen with smooth transitions.
/// 
/// **Navigation Flow:**
/// 1. Start: Shows boot/start screen
/// 2. Transitioning: Animates transition
/// 3. Portfolio: Shows main portfolio interface
/// 
/// **Architecture:**
/// - Uses BLoC pattern for state management
/// - Separates business logic from UI
/// - Reactive to state changes via BlocBuilder
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late AnimationController _transitionController;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  /// Initializes transition animation controller and tween
  /// 
  /// Creates a 1.5 second slide-up animation with cubic easing
  /// for smooth screen transitions.
  void _initializeAnimation() {
    _transitionController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _transitionController,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _transitionController.dispose();
    super.dispose();
  }

  /// Handles navigation to portfolio by dispatching event to BLoC
  /// 
  /// Triggers the transition animation and state change.
  void _navigateToPortfolio() {
    context.read<NavigationBloc>().add(const NavigateToPortfolioEvent());
    _transitionController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Stack(
            children: [
              // Start screen - visible when in start state
              if (state is NavigationStartState)
                StartPage(onStart: _navigateToPortfolio),

              // Portfolio screen - visible during transition and in portfolio state
              if (state is NavigationTransitioningState ||
                  state is NavigationPortfolioState)
                AnimatedBuilder(
                  animation: _slideAnimation,
                  builder: (context, child) {
                    // Slide up animation from bottom
                    return Transform.translate(
                      offset: Offset(
                        0,
                        (1 - _slideAnimation.value) *
                            MediaQuery.of(context).size.height,
                      ),
                      child: const PortfolioPage(),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}



