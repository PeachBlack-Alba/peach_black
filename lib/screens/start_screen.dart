import 'package:flutter/material.dart';
import 'dart:math' as math;

class StartScreen extends StatefulWidget {
  final VoidCallback onStart;
  
  const StartScreen({super.key, required this.onStart});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  late AnimationController _blinkController;
  late AnimationController _scanlineController;
  late Animation<double> _blinkAnimation;
  
  @override
  void initState() {
    super.initState();
    
    // Blinking cursor animation
    _blinkController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    
    _blinkAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _blinkController,
      curve: Curves.easeInOut,
    ));
    
    // Scanline effect
    _scanlineController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _blinkController.dispose();
    _scanlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          // CRT scanlines effect
          AnimatedBuilder(
            animation: _scanlineController,
            builder: (context, child) {
              return CustomPaint(
                painter: ScanlinePainter(_scanlineController.value),
                size: Size.infinite,
              );
            },
          ),
          
          // Main content
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [
                  Color(0xFF001100),
                  Color(0xFF000000),
                ],
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
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
                    // Title with retro styling
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Color(0xFF00FF00),
                          Color(0xFF00AA00),
                          Color(0xFF00FF00),
                        ],
                      ).createShader(bounds),
                      child: const Text(
                        'Alba Torres Rodríguez Portfolio Showcase',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monospace',
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Subtitle with blinking cursor
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Click start to begin',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'monospace',
                            color: Color(0xFF00FF00),
                            letterSpacing: 1,
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _blinkAnimation,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _blinkAnimation.value,
                              child: const Text(
                                '_',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'monospace',
                                  color: Color(0xFF00FF00),
                                  letterSpacing: 1,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 60),
                    
                    // START button with retro styling
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: widget.onStart,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF00FF00),
                              width: 3,
                            ),
                            color: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF00FF00).withOpacity(0.3),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: const Text(
                            'START',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'monospace',
                              color: Color(0xFF00FF00),
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // System info (90s style)
                    const Column(
                      children: [
                        Text(
                          'SYSTEM STATUS: READY',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'monospace',
                            color: Color(0xFF00AA00),
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'PORTFOLIO.EXE v2.0 - LOADING...',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'monospace',
                            color: Color(0xFF00AA00),
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for CRT scanline effect
class ScanlinePainter extends CustomPainter {
  final double animationValue;
  
  ScanlinePainter(this.animationValue);
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00FF00).withOpacity(0.1)
      ..strokeWidth = 1;
    
    // Draw horizontal scanlines
    for (int i = 0; i < size.height; i += 4) {
      canvas.drawLine(
        Offset(0, i.toDouble()),
        Offset(size.width, i.toDouble()),
        paint,
      );
    }
    
    // Moving scanline effect
    final movingY = (animationValue * size.height) % size.height;
    final movingPaint = Paint()
      ..color = const Color(0xFF00FF00).withOpacity(0.3)
      ..strokeWidth = 2;
    
    canvas.drawLine(
      Offset(0, movingY),
      Offset(size.width, movingY),
      movingPaint,
    );
  }
  
  @override
  bool shouldRepaint(ScanlinePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
