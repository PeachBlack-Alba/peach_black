import 'package:flutter/material.dart';
import '../simple_plasma_background.dart';
import '../ui/retro/crt_overlay.dart';
import '../ui/retro/retro_panel.dart';
import '../ui/retro/retro_button.dart';

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
                              ...['ABOUT', 'WORK', 'CONTACT'].map((item) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: RetroButton(
                                    text: item,
                                    onPressed: () {},
                                    fontSize: 14,
                                    fontFamily: 'VT323',
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 8,
                                    ),
                                    borderWidth: 1,
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                        
                        // Main content area
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              width: 800,
                              child: RetroPanel(
                                padding: const EdgeInsets.all(40),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Welcome message
                                    const Text(
                                      'SYSTEM INITIALIZED',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontFamily: 'VT323',
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(1, 1),
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    
                                    const SizedBox(height: 30),
                                    
                                    const Text(
                                      'Portfolio loaded successfully...',
                                      style: TextStyle(
                                        fontSize: 18,
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
                                    
                                    const SizedBox(height: 20),
                                    
                                    const Text(
                                      'DOS-style interface active',
                                      style: TextStyle(
                                        fontSize: 14,
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
                                    
                                    const SizedBox(height: 40),
                                    
                                    // Status indicators
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildStatusIndicator('SYSTEM', 'READY'),
                                        _buildStatusIndicator('CRT', 'ACTIVE'),
                                        _buildStatusIndicator('DOS', 'ENABLED'),
                                      ],
                                    ),
                                    
                                    const SizedBox(height: 40),
                                    
                                    // Action button
                                    RetroButton(
                                      text: 'CONTINUE',
                                      onPressed: () {},
                                      fontSize: 16,
                                      fontFamily: 'VT323',
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 12,
                                      ),
                                    ),
                                  ],
                                ),
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
          ],
        ),
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
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            color: Colors.transparent,
          ),
          child: Text(
            status,
            style: const TextStyle(
              fontSize: 10,
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
        ),
      ],
    );
  }
}