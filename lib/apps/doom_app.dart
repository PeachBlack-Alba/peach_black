import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
// Conditional import for web-only features
import 'doom_app_stub.dart'
    if (dart.library.html) 'doom_app_web.dart';

class DoomApp extends StatefulWidget {
  const DoomApp({super.key});

  @override
  State<DoomApp> createState() => _DoomAppState();
}

class _DoomAppState extends State<DoomApp> {
  late String _viewId;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _viewId = 'doom-iframe-${DateTime.now().millisecondsSinceEpoch}';
    
    if (kIsWeb) {
      registerDoomIframe(_viewId);
    }
    
    // Hide loading after a short delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return Container(
        color: Colors.black,
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF00FFFF), width: 2),
                  color: Colors.black,
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.computer,
                      size: 64,
                      color: Color(0xFF00FFFF),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'DOOM',
                      style: TextStyle(
                        fontFamily: 'VT323',
                        fontSize: 32,
                        color: Colors.white,
                        shadows: [
                          Shadow(offset: Offset(1, 1), color: Colors.black),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'This game is only available on Web platform.',
                      style: TextStyle(
                        fontFamily: 'VT323',
                        fontSize: 16,
                        color: Colors.white70,
                        shadows: [
                          Shadow(offset: Offset(1, 1), color: Colors.black),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Please visit this portfolio in a web browser to play.',
                      style: TextStyle(
                        fontFamily: 'VT323',
                        fontSize: 14,
                        color: Color(0xFF00FFFF),
                        shadows: [
                          Shadow(offset: Offset(1, 1), color: Colors.black),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          // IFrame for DOOM
          HtmlElementView(viewType: _viewId),
          
          // Loading overlay
          if (_isLoading)
            Container(
              color: Colors.black,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Color(0xFF00FFFF),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Initializing DOOM...',
                      style: TextStyle(
                        fontFamily: 'VT323',
                        fontSize: 18,
                        color: Colors.white,
                        shadows: [
                          Shadow(offset: Offset(1, 1), color: Colors.black),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Click on the canvas to enable audio',
                      style: TextStyle(
                        fontFamily: 'VT323',
                        fontSize: 14,
                        color: Color(0xFF00FFFF),
                        shadows: [
                          Shadow(offset: Offset(1, 1), color: Colors.black),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
