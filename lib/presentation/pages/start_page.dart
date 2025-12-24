import 'package:flutter/material.dart';
import '../../screens/start_screen.dart';

/// Start/Boot page wrapper
/// 
/// This page wraps the existing [StartScreen] to maintain compatibility
/// while integrating with the new BLoC-based navigation architecture.
/// 
/// **Responsibilities:**
/// - Display the 90's DOS boot screen
/// - Handle user interaction to start the portfolio
/// - Delegate navigation callback to parent
/// 
/// **Design:**
/// - Follows adapter pattern to bridge old and new architecture
/// - Will be refactored in future iterations
class StartPage extends StatelessWidget {
  /// Callback triggered when user initiates portfolio navigation
  final VoidCallback onStart;

  const StartPage({
    super.key,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    // Delegates to existing StartScreen implementation
    // TODO: Refactor StartScreen to be presentation-layer pure
    return StartScreen(onStart: onStart);
  }
}



