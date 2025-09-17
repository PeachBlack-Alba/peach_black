import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A draggable, focusable retro window with title bar and close button
class RetroWindow extends StatefulWidget {
  final String title;
  final Widget child;
  final Offset initialPosition;
  final Size initialSize;
  final Size? minSize;
  final VoidCallback? onClose;
  final VoidCallback? onFocus;
  
  const RetroWindow({
    super.key,
    required this.title,
    required this.child,
    this.initialPosition = const Offset(100, 100),
    this.initialSize = const Size(400, 300),
    this.minSize,
    this.onClose,
    this.onFocus,
  });

  @override
  State<RetroWindow> createState() => _RetroWindowState();
}

class _RetroWindowState extends State<RetroWindow> {
  late Offset _position;
  late Size _size;
  late FocusNode _focusNode;
  bool _isDragging = false;
  bool _isFocused = false;
  
  @override
  void initState() {
    super.initState();
    _position = widget.initialPosition;
    _size = widget.initialSize;
    _focusNode = FocusNode();
    
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    
    // Auto-focus when created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _bringToFront() {
    _focusNode.requestFocus();
    widget.onFocus?.call();
  }

  void _handleClose() {
    widget.onClose?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _position.dx,
      top: _position.dy,
      child: Focus(
        focusNode: _focusNode,
        onKeyEvent: (node, event) {
          if (event is KeyDownEvent && 
              event.logicalKey == LogicalKeyboardKey.escape) {
            _handleClose();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: _bringToFront,
          child: Container(
            width: _size.width,
            height: _size.height,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.95),
              border: Border.all(
                color: _isFocused ? Colors.white : Colors.white54,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  blurRadius: 10,
                  offset: const Offset(2, 2),
                ),
                // Inner shadow effect
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                // Title bar
                GestureDetector(
                  onPanStart: (details) {
                    _isDragging = true;
                    _bringToFront();
                  },
                  onPanUpdate: (details) {
                    if (_isDragging) {
                      setState(() {
                        _position += details.delta;
                        
                        // Keep window within screen bounds
                        final screenSize = MediaQuery.of(context).size;
                        _position = Offset(
                          _position.dx.clamp(0, screenSize.width - _size.width),
                          _position.dy.clamp(0, screenSize.height - _size.height),
                        );
                      });
                    }
                  },
                  onPanEnd: (details) {
                    _isDragging = false;
                  },
                  child: Container(
                    width: double.infinity,
                    height: 28,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _isFocused 
                          ? [Colors.grey.shade800, Colors.grey.shade700]
                          : [Colors.grey.shade900, Colors.grey.shade800],
                      ),
                      border: const Border(
                        bottom: BorderSide(
                          color: Colors.white24,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        // Window icon placeholder
                        Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            border: Border.all(
                              color: Colors.white38,
                              width: 1,
                            ),
                          ),
                          child: const Icon(
                            Icons.terminal,
                            size: 18,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Title
                        Expanded(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              fontFamily: 'VT323',
                              fontSize: 18,
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
                        // Close button
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: _handleClose,
                            child: Container(
                              width: 20,
                              height: 20,
                              margin: const EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white54,
                                  width: 1,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  '×',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Content area
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(1),
                    child: widget.child,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
