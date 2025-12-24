import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ui/retro/crt_overlay.dart';
import '../ui/retro/retro_panel.dart';
import '../ui/retro/retro_button.dart';

class StartScreen extends StatefulWidget {
  final VoidCallback onStart;
  
  const StartScreen({super.key, required this.onStart});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  late AnimationController _blinkController;
  late Animation<double> _blinkAnimation;
  late FocusNode _focusNode;
  
  bool _isLoading = false;
  String _loadingText = '';
  
  @override
  void initState() {
    super.initState();
    
    _focusNode = FocusNode();
    
    // Blinking cursor animation
    _blinkController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    
    _blinkAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_blinkController);
    
    // Auto-focus for keyboard input
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _blinkController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
  
  void _handleStart() async {
    if (_isLoading) return;
    
    setState(() {
      _isLoading = true;
      _loadingText = 'LOADING...';
    });
    
    // Simulate loading delay
    await Future.delayed(const Duration(milliseconds: 700));
    
    setState(() {
      _loadingText = 'LOADING... DONE';
    });
    
    await Future.delayed(const Duration(milliseconds: 700));
    
    widget.onStart();
  }
  
  @override
  Widget build(BuildContext context) {
    return CRTOverlay(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: KeyboardListener(
          focusNode: _focusNode,
          onKeyEvent: (event) {
            if (event is KeyDownEvent) {
              if (event.logicalKey == LogicalKeyboardKey.enter ||
                  event.logicalKey == LogicalKeyboardKey.space) {
                _handleStart();
              }
            }
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                // Spacer to push panel to ~65% height
                const Spacer(flex: 65),
                
                // Main panel
                Center(
                  child: SizedBox(
                    width: 600,
                    child: RetroPanel(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Title
                          const Text(
                            'Alba Torres Rodríguez Portfolio',
                            style: TextStyle(
                              fontSize: 26,
                              fontFamily: 'VT323',
                              color: Colors.white,
                              height: 1.2,
                              shadows: [
                                Shadow(
                                  offset: Offset(1, 1),
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Subtitle with blinking cursor
                          Row(
                            children: [
                              const Text(
                                'Click start to begin',
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
                              const SizedBox(width: 4),
                              AnimatedBuilder(
                                animation: _blinkAnimation,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity: _blinkAnimation.value,
                                    child: const Text(
                                      '|',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'VT323',
                                        color: Color(0xFF4AF626),
                                        shadows: [
                                          Shadow(
                                            offset: Offset(1, 1),
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 30),
                          
                          // Loading text or START button
                          if (_isLoading)
                            Text(
                              _loadingText,
                              style: const TextStyle(
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
                            )
                          else
                            RetroButton(
                              text: 'START',
                              onPressed: _handleStart,
                              fontSize: 18,
                              fontFamily: 'VT323',
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Bottom spacer
                const Spacer(flex: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}