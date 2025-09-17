import 'package:flutter/material.dart';
import 'screens/start_screen.dart';
import 'screens/portfolio_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alba Torres Rodríguez Portfolio \n Click start to begin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00FF00), // Retro green
          brightness: Brightness.dark,
        ),
        fontFamily: 'monospace', // 90s style monospace font
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with TickerProviderStateMixin {
  bool _showPortfolio = false;
  late AnimationController _transitionController;
  late Animation<double> _slideAnimation;
  
  @override
  void initState() {
    super.initState();
    
    _transitionController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _slideAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _transitionController,
      curve: Curves.easeInOutCubic,
    ));
  }

  @override
  void dispose() {
    _transitionController.dispose();
    super.dispose();
  }

  void _startPortfolio() {
    setState(() {
      _showPortfolio = true;
    });
    _transitionController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Start screen
          if (!_showPortfolio)
            StartScreen(onStart: _startPortfolio),
          
          // Portfolio screen with transition
          if (_showPortfolio)
            AnimatedBuilder(
              animation: _slideAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    0,
                    (1 - _slideAnimation.value) * MediaQuery.of(context).size.height,
                  ),
                  child: const PortfolioScreen(),
                );
              },
            ),
        ],
      ),
    );
  }
}