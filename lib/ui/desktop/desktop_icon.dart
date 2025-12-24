import 'package:flutter/material.dart';

class DesktopIcon extends StatefulWidget {
  final String label;
  final IconData? icon;
  final Widget? customIcon;
  final String? imagePath;
  final Color iconColor;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  
  const DesktopIcon({
    super.key,
    required this.label,
    this.icon,
    this.customIcon,
    this.imagePath,
    this.iconColor = Colors.blue,
    this.onTap,
    this.onDoubleTap,
  });

  @override
  State<DesktopIcon> createState() => _DesktopIconState();
}

class _DesktopIconState extends State<DesktopIcon> {
  bool _isSelected = false;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = true;
          });
          widget.onTap?.call();
          // Auto-deselect after a short delay
          Future.delayed(const Duration(milliseconds: 200), () {
            if (mounted) {
              setState(() {
                _isSelected = false;
              });
            }
          });
        },
        onDoubleTap: widget.onDoubleTap,
        child: Container(
          width: 90,
          padding: const EdgeInsets.all(8),
          decoration: _isSelected
              ? BoxDecoration(
                  color: Colors.blue.withOpacity(0.3),
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                )
              : null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon container
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: widget.customIcon == null && widget.imagePath == null 
                      ? widget.iconColor 
                      : Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: widget.customIcon ??
                    (widget.imagePath != null
                        ? Image.asset(
                            widget.imagePath!,
                            width: 48,
                            height: 48,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.none, // Pixelated look
                          )
                        : Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            child: Icon(
                              widget.icon ?? Icons.apps,
                              color: Colors.white,
                              size: 24,
                            ),
                          )),
              ),
              
              const SizedBox(height: 4),
              
              // Label
              Text(
                widget.label,
                style: TextStyle(
                  fontFamily: 'VT323',
                  fontSize: 16,
                  color: _isSelected ? Colors.white : Colors.white70,
                  shadows: [
                    Shadow(
                      offset: const Offset(1, 1),
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
