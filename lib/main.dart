import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'presentation/bloc/navigation/navigation_bloc.dart';
import 'presentation/bloc/window_management/window_management_bloc.dart';
import 'presentation/pages/main_page.dart';

/// Entry point of the 90's DOS-style Portfolio Application
/// 
/// This application demonstrates CLEAN architecture principles with:
/// - **Presentation Layer**: BLoCs, Pages, Widgets
/// - **Domain Layer**: Entities, Use Cases
/// - **Core**: Constants, Theme, Utilities
/// 
/// **State Management**: flutter_bloc (BLoC pattern)
/// **Architecture**: CLEAN Architecture
/// **Design Principles**: SOLID
void main() {
  runApp(const PortfolioApp());
}

/// Root widget of the application
/// 
/// Provides BLoC instances and MaterialApp configuration with
/// retro 90's DOS-style theme.
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Navigation BLoC - manages screen transitions
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
        // Window Management BLoC - manages open windows state
        BlocProvider<WindowManagementBloc>(
          create: (context) => WindowManagementBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Alba Torres Rodríguez - Retro Portfolio',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const MainPage(),
      ),
    );
  }
}
