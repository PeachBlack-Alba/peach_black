import 'package:flutter/material.dart';
import '../../screens/portfolio_screen.dart';

/// Portfolio page wrapper
/// 
/// This page wraps the existing [PortfolioScreen] to maintain compatibility
/// while integrating with the new BLoC-based architecture for window management.
/// 
/// **Responsibilities:**
/// - Display the main portfolio interface
/// - Manage retro windows through WindowManagementBloc
/// - Show desktop icons and interactive elements
/// - Render CRT overlay effects
/// 
/// **Design:**
/// - Follows adapter pattern to bridge old and new architecture
/// - Windows are managed through WindowManagementBloc
/// - Will be refactored in future iterations for cleaner separation
class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Delegates to existing PortfolioScreen implementation
    // TODO: Refactor PortfolioScreen to use WindowManagementBloc directly
    // TODO: Extract window creation logic to presentation layer
    return const PortfolioScreen();
  }
}



