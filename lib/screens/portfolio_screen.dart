import 'package:flutter/material.dart';
import '../simple_plasma_background.dart';
import '../ui/retro/crt_overlay.dart';
import '../ui/retro/retro_button.dart';
import '../ui/retro/blinking_cursor.dart';
import '../ui/retro/code_panel.dart';
import '../ui/windows/retro_window.dart';
import '../ui/windows/about_window.dart';
import '../ui/windows/work_window.dart';
import '../ui/windows/contact_window.dart';
import '../ui/desktop/desktop_icon.dart';
import '../apps/doom_app.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> with TickerProviderStateMixin {
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    
    setState(() {
      _windows.add(
        RetroWindow(
          key: UniqueKey(),
          title: 'About Alba',
          initialPosition: Offset(
            isMobile ? 10 : screenWidth * 0.2,
            isMobile ? 10 : screenHeight * 0.2,
          ),
          initialSize: isMobile 
              ? Size(screenWidth - 20, screenHeight - 20)
              : const Size(800, 700),
          minSize: const Size(300, 300),
          onClose: () {
            setState(() {
              _windows.removeWhere((window) => (window as RetroWindow).title == 'About Alba');
            });
          },
          child: const AboutWindow(),
        ),
      );
    });
  }

  void _openWorkWindow() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    
    setState(() {
      _windows.add(
        RetroWindow(
          key: UniqueKey(),
          title: 'My Work',
          initialPosition: Offset(
            isMobile ? 10 : screenWidth * 0.2,
            isMobile ? 10 : screenHeight * 0.2,
          ),
          initialSize: isMobile 
              ? Size(screenWidth - 20, screenHeight - 20)
              : const Size(800, 700),
          minSize: const Size(300, 300),
          onClose: () {
            setState(() {
              _windows.removeWhere((window) => (window as RetroWindow).title == 'My Work');
            });
          },
          child: const WorkWindow(),
        ),
      );
    });
  }

  void _openContactWindow() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    
    setState(() {
      _windows.add(
        RetroWindow(
          key: UniqueKey(),
          title: 'Contact',
          initialPosition: Offset(
            isMobile ? 10 : screenWidth * 0.2,
            isMobile ? 10 : screenHeight * 0.2,
          ),
          initialSize: isMobile 
              ? Size(screenWidth - 20, screenHeight - 20)
              : const Size(800, 700),
          minSize: const Size(300, 300),
          onClose: () {
            setState(() {
              _windows.removeWhere((window) => (window as RetroWindow).title == 'Contact');
            });
          },
          child: const ContactWindow(),
        ),
      );
    });
  }

  void _openDoomWindow() {
    // Check if DOOM window is already open
    final hasDoomWindow = _windows.any((window) => 
      window is RetroWindow && (window as RetroWindow).title == 'DOOM'
    );
    
    if (hasDoomWindow) {
      return; // Don't open duplicate windows
    }
    
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    
    setState(() {
      _windows.add(
        RetroWindow(
          key: UniqueKey(),
          title: 'DOOM',
          initialPosition: Offset(
            isMobile ? 10 : screenWidth * 0.15,
            isMobile ? 10 : screenHeight * 0.1,
          ),
          initialSize: isMobile 
              ? Size(screenWidth - 20, screenHeight - 20)
              : const Size(900, 700),
          minSize: const Size(320, 240),
          onClose: () {
            setState(() {
              _windows.removeWhere((window) => 
                window is RetroWindow && (window as RetroWindow).title == 'DOOM'
              );
            });
          },
          child: const DoomApp(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    
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
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        // Top bar
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(isMobile ? 10 : 20),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            border: const Border(
                              bottom: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                          ),
                          child: isMobile 
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Logo/Title
                                  const Text(
                                    'ALBA.EXE',
                                    style: TextStyle(
                                      fontSize: 20,
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
                                  const SizedBox(height: 10),
                                  // Navigation buttons stacked
                                  Wrap(
                                    spacing: 10,
                                    runSpacing: 8,
                                    children: [
                                      RetroButton(
                                        text: 'ABOUT',
                                        onPressed: _openAboutWindow,
                                        fontSize: 16,
                                        fontFamily: 'VT323',
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        borderWidth: 1,
                                      ),
                                      RetroButton(
                                        text: 'WORK',
                                        onPressed: _openWorkWindow,
                                        fontSize: 16,
                                        fontFamily: 'VT323',
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        borderWidth: 1,
                                      ),
                                      RetroButton(
                                        text: 'CONTACT',
                                        onPressed: _openContactWindow,
                                        fontSize: 16,
                                        fontFamily: 'VT323',
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        borderWidth: 1,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Row(
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
                                    fontSize: isTablet ? 16 : 18,
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
                                    onPressed: _openWorkWindow,
                                    fontSize: isTablet ? 16 : 18,
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
                                    onPressed: _openContactWindow,
                                    fontSize: isTablet ? 16 : 18,
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
                                top: isMobile ? 20 : 60,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        'System initialised ',
                                        style: TextStyle(
                                          fontSize: isMobile ? 20.0 : 28.0,
                                          fontFamily: 'VT323',
                                          color: Colors.white,
                                          shadows: const [
                                            Shadow(
                                              offset: Offset(1, 1),
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      BlinkingCursor(
                                        width: isMobile ? 10 : 14,
                                        height: isMobile ? 16 : 22,
                                        blinkDuration: const Duration(milliseconds: 650),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Bottom-left code panel (render first, so it's behind icons)
                              // Hide on mobile, show on tablet and desktop
                              if (!isMobile)
                                Positioned(
                                  bottom: isTablet ? 20 : 40,
                                  left: isTablet ? 20 : 40,
                                  child: CodePanel(
                                    fileName: 'main.java',
                                    width: isTablet ? 350 : 500,
                                    height: isTablet ? 500 : 700,
                                    code: '''public class Main {^300
  public static void main(String[] args) {^200
    System.out.println("Loading Alba's portfolio...");^500

    String[] skills = new String[]{^200
      "Flutter Development",^200
      "Web Technologies",^200
      "UI/UX Design",^200
      "Problem Solving"^300
    };^200

    for (String skill : skills) {^200
      System.out.println("✓ " + skill);^100
    }^300

    String status = initPortfolio();^200
    System.out.println(status);^800
  }^300

  private static String initPortfolio() {^300
    // TODO: load projects, set up routes, prime caches...^300
    return "Portfolio ready!";^300
  }^300
}''',
                                    typingSpeed: const Duration(milliseconds: 60),
                                    loop: true,
                                    loopDelay: const Duration(seconds: 4),
                                  ),
                                ),

                              // Desktop icons (render last, so they're on top)
                              Positioned(
                                top: isMobile ? 80 : 120,
                                right: isMobile ? 10 : (isTablet ? 20 : 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    DesktopIcon(
                                      label: 'DOOM',
                                      imagePath: 'assets/images/doom-icon.png',
                                      onTap: _openDoomWindow,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(isMobile ? 8 : 15),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            border: const Border(
                              top: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'STATUS: READY',
                                style: TextStyle(
                                  fontSize: isMobile ? 12 : 14,
                                  fontFamily: 'VT323',
                                  color: const Color(0xFF4AF626),
                                  shadows: const [
                                    Shadow(
                                      offset: Offset(1, 1),
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Text(
                                isMobile ? 'v2.0' : 'PORTFOLIO.EXE v2.0',
                                style: TextStyle(
                                  fontSize: isMobile ? 12 : 14,
                                  fontFamily: 'VT323',
                                  color: Colors.white70,
                                  shadows: const [
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
