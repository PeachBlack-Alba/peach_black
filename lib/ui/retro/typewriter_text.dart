import 'package:flutter/material.dart';
import 'dart:async';

/// A typewriter text widget that types characters one by one with pause support
/// Supports pause notation like "^500" for 500ms pauses
class TypewriterText extends StatefulWidget {
  final String text;
  final Duration typingSpeed;
  final TextStyle? textStyle;
  final bool loop;
  final Duration loopDelay;
  final VoidCallback? onComplete;
  
  const TypewriterText({
    super.key,
    required this.text,
    this.typingSpeed = const Duration(milliseconds: 50),
    this.textStyle,
    this.loop = false,
    this.loopDelay = const Duration(seconds: 2),
    this.onComplete,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayedText = '';
  int _currentIndex = 0;
  Timer? _timer;
  bool _isTyping = false;
  
  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTyping() {
    if (_isTyping) return;
    
    _isTyping = true;
    _currentIndex = 0;
    _displayedText = '';
    
    _typeNextCharacter();
  }

  void _typeNextCharacter() {
    if (_currentIndex >= widget.text.length) {
      _isTyping = false;
      widget.onComplete?.call();
      
      if (widget.loop) {
        Timer(widget.loopDelay, () {
          if (mounted) {
            _startTyping();
          }
        });
      }
      return;
    }

    // Check for pause notation ^XXX
    if (_currentIndex < widget.text.length - 1 && 
        widget.text[_currentIndex] == '^') {
      final pauseMatch = RegExp(r'\^(\d+)').firstMatch(
        widget.text.substring(_currentIndex)
      );
      
      if (pauseMatch != null) {
        final pauseDuration = int.parse(pauseMatch.group(1)!);
        _currentIndex += pauseMatch.group(0)!.length;
        
        _timer = Timer(Duration(milliseconds: pauseDuration), () {
          if (mounted) {
            _typeNextCharacter();
          }
        });
        return;
      }
    }

    setState(() {
      _displayedText += widget.text[_currentIndex];
      _currentIndex++;
    });

    _timer = Timer(widget.typingSpeed, () {
      if (mounted) {
        _typeNextCharacter();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: widget.textStyle ?? const TextStyle(
        fontFamily: 'VT323',
        color: Colors.white,
        fontSize: 14,
        shadows: [
          Shadow(
            offset: Offset(1, 1),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
