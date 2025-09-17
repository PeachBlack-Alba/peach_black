import 'package:flutter/material.dart';
import '../simple_plasma_background.dart';
import '../ui/retro/crt_overlay.dart';
import '../ui/retro/retro_button.dart';
import '../ui/retro/blinking_cursor.dart';
import '../ui/retro/code_panel.dart';
import '../ui/windows/retro_window.dart';
import '../ui/windows/about_window.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  
  final List<Widget> _windows = [];
  
  @override
  void initState() {
    super.initState();
    
    // Fade in animation when entering portfolio
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    
    // Start the fade in animation
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
  
  void _openAboutWindow() {
    setState(() {
      _windows.add(
        RetroWindow(
          key: UniqueKey(),
          title: 'About Alba',
          initialPosition: Offset(
            MediaQuery.of(context).size.width * 0.3,
            MediaQuery.of(context).size.height * 0.2,
          ),
          initialSize: const Size(520, 360),
          minSize: const Size(400, 300),
          onClose: () {
            setState(() {
              _windows.removeWhere((window) => 
                (window as RetroWindow).title == 'About Alba');
            });
          },
          child: const AboutWindow(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CRTOverlay(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Very subtle plasma background (barely visible under CRT overlay)
            const Positioned.fill(
              child: Opacity(
                opacity: 0.03,
                child: SimplePlasmaBackground(
                  color: Colors.white,
                  speed: 0.3,
                  opacity: 0.1,
                ),
              ),
            ),
            
            // Content overlay with fade-in effect
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        // Top bar
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            border: const Border(
                              bottom: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              // Logo/Title
                              const Text(
                                'ALBA.EXE',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'VT323',
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(1, 1),
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              
                              // Navigation buttons
                              RetroButton(
                                text: 'ABOUT',
                                onPressed: _openAboutWindow,
                                fontSize: 14,
                                fontFamily: 'VT323',
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 8,
                                ),
                                borderWidth: 1,
                              ),
                              
                              const SizedBox(width: 20),
                              
                              RetroButton(
                                text: 'WORK',
                                onPressed: () {},
                                fontSize: 14,
                                fontFamily: 'VT323',
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 8,
                                ),
                                borderWidth: 1,
                              ),
                              
                              const SizedBox(width: 20),
                              
                              RetroButton(
                                text: 'CONTACT',
                                onPressed: () {},
                                fontSize: 14,
                                fontFamily: 'VT323',
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 8,
                                ),
                                borderWidth: 1,
                              ),
                            ],
                          ),
                        ),
                        
                        // Main content area
                        Expanded(
                          child: Stack(
                            children: [
                              // Header title centered near top
                              Positioned(
                                top: 60,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      const Text(
                                        'System initialised ',
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontFamily: 'VT323',
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                              offset: Offset(1, 1),
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const BlinkingCursor(
                                        width: 14,
                                        height: 22,
                                        blinkDuration: Duration(milliseconds: 650),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              
                              // Bottom-left code panel
                              Positioned(
                                bottom: 40,
                                left: 40,
                                child: CodePanel(
                                  fileName: 'main.js',
                                  width: 450,
                                  height: 280,
                                  code: '''function initPortfolio() {^300
    console.log("Loading Alba's portfolio...");^500
    
    const skills = [
        "Flutter Development",^200
        "Web Technologies",^200
        "UI/UX Design",^200
        "Problem Solving"^300
    ];
    
    skills.forEach(skill => {^200
        console.log(`✓ \${skill}`);^100
    });^500
    
    return "Portfolio ready!";^800
}

initPortfolio();''',
                                  typingSpeed: const Duration(milliseconds: 60),
                                  loop: true,
                                  loopDelay: const Duration(seconds: 4),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Bottom status bar
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            border: const Border(
                              top: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'STATUS: READY',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'VT323',
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(1, 1),
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Text(
                                'PORTFOLIO.EXE v2.0',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'VT323',
                                  color: Colors.white70,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(1, 1),
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            
            // Windows layer
            ..._windows,
          ],
        ),
      ),
    );
  }
}