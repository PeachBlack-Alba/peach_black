import 'package:flutter/material.dart';
import '../simple_plasma_background.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Plasma background
          const Positioned.fill(
            child: SimplePlasmaBackground(
              color: Color(0xFF00FF00), // Retro orange
              speed: 0.8,
              opacity: 0.9,
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
                      // Top bar with retro styling
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          border: const Border(
                            bottom: BorderSide(
                              color: Color(0xFF00FF00),
                              width: 2,
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
                                fontWeight: FontWeight.bold,
                                fontFamily: 'monospace',
                                color: Color(0xFF00FF00),
                                letterSpacing: 2,
                              ),
                            ),
                            const Spacer(),
                            
                            // Navigation buttons (90s style)
                            ...['ABOUT', 'WORK', 'CONTACT'].map((item) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFF00FF00),
                                        width: 1,
                                      ),
                                      color: Colors.transparent,
                                    ),
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'monospace',
                                        color: Color(0xFF00FF00),
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                      
                      // Main content area
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(40),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              border: Border.all(
                                color: const Color(0xFF00FF00),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF00FF00).withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Welcome message
                                ShaderMask(
                                  shaderCallback: (bounds) => const LinearGradient(
                                    colors: [
                                      Color(0xFF00FF00),
                                      Color(0xFFFFFF00),
                                      Color(0xFF00FF00),
                                    ],
                                  ).createShader(bounds),
                                  child: const Text(
                                    'WELCOME TO THE MATRIX',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'monospace',
                                      color: Colors.white,
                                      letterSpacing: 3,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                
                                const SizedBox(height: 30),
                                
                                const Text(
                                  'Portfolio loaded successfully...',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'monospace',
                                    color: Color(0xFF00FF00),
                                    letterSpacing: 1,
                                  ),
                                ),
                                
                                const SizedBox(height: 20),
                                
                                const Text(
                                  'Experience the retro plasma effect',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'monospace',
                                    color: Color(0xFF00AA00),
                                    letterSpacing: 1,
                                  ),
                                ),
                                
                                const SizedBox(height: 40),
                                
                                // Status indicators
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildStatusIndicator('SYSTEM', 'ONLINE'),
                                    const SizedBox(width: 40),
                                    _buildStatusIndicator('PLASMA', 'ACTIVE'),
                                    const SizedBox(width: 40),
                                    _buildStatusIndicator('RETRO', 'ENABLED'),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
                              color: Color(0xFF00FF00),
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'STATUS: READY',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'monospace',
                                color: Color(0xFF00FF00),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'PORTFOLIO.EXE v2.0',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'monospace',
                                color: Color(0xFF00AA00),
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
        ],
      ),
    );
  }
  
  Widget _buildStatusIndicator(String label, String status) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'monospace',
            color: Color(0xFF00AA00),
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF00FF00),
              width: 1,
            ),
            color: const Color(0xFF00FF00).withOpacity(0.1),
          ),
          child: Text(
            status,
            style: const TextStyle(
              fontSize: 10,
              fontFamily: 'monospace',
              color: Color(0xFF00FF00),
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}
