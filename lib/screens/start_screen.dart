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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    
    // Responsive sizing
    final panelWidth = isMobile 
        ? screenWidth * 0.9 
        : isTablet 
            ? screenWidth * 0.7 
            : 600.0;
    
    final titleFontSize = isMobile ? 22.0 : 26.0;
    final subtitleFontSize = isMobile ? 18.0 : 20.0;
    final padding = isMobile ? 20.0 : 30.0;
    
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
                    width: panelWidth,
                    child: RetroPanel(
                      padding: EdgeInsets.all(padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Title
                          Text(
                            'Alba Torres Rodríguez Portfolio',
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontFamily: 'VT323',
                              color: Colors.white,
                              height: 1.2,
                              shadows: const [
                                Shadow(
                                  offset: Offset(1, 1),
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          
                          SizedBox(height: isMobile ? 15 : 20),
                          
                          // Subtitle with blinking cursor
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Click start to begin',
                                  style: TextStyle(
                                    fontSize: subtitleFontSize,
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
                              ),
                              const SizedBox(width: 4),
                              AnimatedBuilder(
                                animation: _blinkAnimation,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity: _blinkAnimation.value,
                                    child: Text(
                                      '_',
                                      style: TextStyle(
                                        fontSize: subtitleFontSize,
                                        fontFamily: 'VT323',
                                        color: const Color(0xFF00FFFF),
                                        shadows: const [
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
                          
                          SizedBox(height: isMobile ? 20 : 30),
                          
                          // Loading text or START button
                          if (_isLoading)
                            Text(
                              _loadingText,
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontFamily: 'VT323',
                                color: Colors.white,
                                shadows: const [
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
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 20 : 30,
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