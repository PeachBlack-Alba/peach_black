import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/constants/app_constants.dart';

/// Retro typewriter text animation widget
/// 
/// Displays text character-by-character like an old terminal or typewriter,
/// creating an authentic DOS-era computing experience.
/// 
/// **Features:**
/// - Character-by-character animation
/// - Configurable typing speed
/// - Pause notation support (^500 = 500ms pause)
/// - Optional looping with delay
/// - Completion callback
/// 
/// **Pause Notation:**
/// Embed `^XXX` in your text where XXX is milliseconds to pause:
/// ```dart
/// TypewriterText(text: "Hello^500 World") // Pauses 500ms between Hello and World
/// ```
/// 
/// **Example Usage:**
/// ```dart
/// TypewriterText(
///   text: "Loading system...^800\nDone!",
///   typingSpeed: Duration(milliseconds: 50),
///   onComplete: () => print("Finished typing"),
/// )
/// ```
/// 
/// **Performance:**
/// Uses Flutter's Timer for efficient character scheduling.
/// Properly disposes timers to prevent memory leaks.
class TypewriterText extends StatefulWidget {
  /// The text to display with typewriter effect
  /// Can include pause notation (^XXX for millisecond pauses)
  final String text;
  
  /// Speed at which each character appears
  final Duration typingSpeed;
  
  /// Optional custom text style (defaults to retro VT323 style)
  final TextStyle? textStyle;
  
  /// Whether to loop the animation continuously
  final bool loop;
  
  /// Delay between loop iterations (only used if loop = true)
  final Duration loopDelay;
  
  /// Callback invoked when typing completes
  final VoidCallback? onComplete;
  
  const TypewriterText({
    super.key,
    required this.text,
    this.typingSpeed = AppConstants.typewriterCharDuration,
    this.textStyle,
    this.loop = false,
    this.loopDelay = const Duration(seconds: 2),
    this.onComplete,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

/// Private state class for [TypewriterText]
/// 
/// Manages the character-by-character animation using Timers and indexes.
/// Handles pause notation parsing and loop logic.
class _TypewriterTextState extends State<TypewriterText> {
  /// The portion of text currently displayed on screen
  String _displayedText = '';
  
  /// Current index in the source text being typed
  int _currentIndex = 0;
  
  /// Timer for scheduling next character
  Timer? _timer;
  
  /// Whether the typewriter is currently active
  bool _isTyping = false;
  
  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  @override
  void dispose() {
    // Cancel any active timer to prevent memory leaks
    _timer?.cancel();
    super.dispose();
  }

  /// Starts or restarts the typewriter animation from the beginning
  /// 
  /// Resets all state variables and begins typing the first character.
  /// Does nothing if already typing.
  void _startTyping() {
    if (_isTyping) return;
    
    _isTyping = true;
    _currentIndex = 0;
    _displayedText = '';
    
    _typeNextCharacter();
  }

  /// Types the next character or handles pause notation
  /// 
  /// This method is called recursively via Timers to animate the text.
  /// It handles three scenarios:
  /// 1. **End of text**: Triggers completion callback and optional loop
  /// 2. **Pause notation**: Parses ^XXX and schedules next char after delay
  /// 3. **Regular char**: Displays char and schedules next one
  /// 
  /// **Pause Notation Pattern**: `^(\d+)` matches ^123, ^500, etc.
  void _typeNextCharacter() {
    // Check if typing is complete
    if (_currentIndex >= widget.text.length) {
      _isTyping = false;
      widget.onComplete?.call();
      
      // Schedule loop restart if enabled
      if (widget.loop) {
        Timer(widget.loopDelay, () {
          if (mounted) {
            _startTyping();
          }
        });
      }
      return;
    }

    // Check for pause notation: ^XXX (e.g., ^500 for 500ms pause)
    if (_currentIndex < widget.text.length - 1 && 
        widget.text[_currentIndex] == '^') {
      final pauseMatch = RegExp(r'\^(\d+)').firstMatch(
        widget.text.substring(_currentIndex)
      );
      
      if (pauseMatch != null) {
        final pauseDuration = int.parse(pauseMatch.group(1)!);
        _currentIndex += pauseMatch.group(0)!.length;
        
        // Schedule next character after pause duration
        _timer = Timer(Duration(milliseconds: pauseDuration), () {
          if (mounted) {
            _typeNextCharacter();
          }
        });
        return;
      }
    }

    // Display next character
    setState(() {
      _displayedText += widget.text[_currentIndex];
      _currentIndex++;
    });

    // Schedule next character at typing speed
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
        fontFamily: AppConstants.fontFamily,
        color: AppConstants.primaryTextColor,
        fontSize: 14,
        shadows: AppConstants.textShadow,
      ),
    );
  }
}
