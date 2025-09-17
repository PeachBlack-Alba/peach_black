import 'package:flutter/material.dart';
import 'typewriter_text.dart';

/// A retro code panel with cyan glow and typewriter effect
class CodePanel extends StatelessWidget {
  final String fileName;
  final String code;
  final double width;
  final double height;
  final Color glowColor;
  final Duration typingSpeed;
  final bool loop;
  final Duration loopDelay;
  
  const CodePanel({
    super.key,
    required this.fileName,
    required this.code,
    this.width = 400,
    this.height = 300,
    this.glowColor = const Color(0xFF00FFFF), // Cyan
    this.typingSpeed = const Duration(milliseconds: 60),
    this.loop = true,
    this.loopDelay = const Duration(seconds: 3),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          // Outer cyan glow
          BoxShadow(
            color: glowColor.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 2,
          ),
          // Inner subtle glow
          BoxShadow(
            color: glowColor.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // File header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade900.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
            ),
            child: Text(
              fileName,
              style: const TextStyle(
                fontFamily: 'VT323',
                fontSize: 18,
                color: Colors.white70,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          
          // Code content area
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: TypewriterText(
                  text: code,
                  typingSpeed: typingSpeed,
                  loop: loop,
                  loopDelay: loopDelay,
                  textStyle: const TextStyle(
                    fontFamily: 'VT323',
                    fontSize: 18,
                    color: Colors.white,
                    height: 1.4,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
