import 'package:flutter/material.dart';

/// Application-wide constants for consistent styling and behavior
/// 
/// This class provides centralized configuration for colors, sizes,
/// durations, and other values used throughout the application.
/// 
/// **Benefits:**
/// - Single source of truth for design values
/// - Easy to maintain and update
/// - Consistent look and feel across all screens
/// - Follows SOLID principles (Single Responsibility)
class AppConstants {
  // Prevent instantiation
  AppConstants._();

  // ============ COLORS ============
  
  /// Primary accent color for interactive elements (green)
  static const Color accentColor = Color(0xFF4AF626);
  
  /// Background color for screens and panels
  static const Color backgroundColor = Colors.black;
  
  /// Primary text color
  static const Color primaryTextColor = Colors.white;
  
  /// Secondary text color (slightly dimmed)
  static const Color secondaryTextColor = Color(0xFFCCCCCC);
  
  /// Border color for retro panels and windows
  static const Color borderColor = Colors.white;
  
  /// Error/warning color
  static const Color errorColor = Color(0xFFFF0000);

  // ============ TYPOGRAPHY ============
  
  /// Main retro font family
  static const String fontFamily = 'VT323';
  
  /// Text shadow for retro CRT effect
  static const List<Shadow> textShadow = [
    Shadow(offset: Offset(1, 1), color: Colors.black),
  ];

  // ============ SIZING ============
  
  /// Standard spacing unit (8px grid system)
  static const double spacingUnit = 8.0;
  
  /// Small spacing (1 unit)
  static const double spacingSmall = spacingUnit;
  
  /// Medium spacing (2 units)
  static const double spacingMedium = spacingUnit * 2;
  
  /// Large spacing (3 units)
  static const double spacingLarge = spacingUnit * 3;
  
  /// Extra large spacing (4 units)
  static const double spacingXLarge = spacingUnit * 4;
  
  /// Default border width for retro panels
  static const double borderWidth = 2.0;
  
  /// Inner border width for double-border effect
  static const double innerBorderWidth = 1.0;

  // ============ WINDOW DEFAULTS ============
  
  /// Default window width
  static const double defaultWindowWidth = 520.0;
  
  /// Default window height
  static const double defaultWindowHeight = 360.0;
  
  /// Minimum window width
  static const double minWindowWidth = 400.0;
  
  /// Minimum window height
  static const double minWindowHeight = 300.0;
  
  /// Title bar height for retro windows
  static const double windowTitleBarHeight = 32.0;

  // ============ ANIMATION DURATIONS ============
  
  /// Duration for screen transitions
  static const Duration transitionDuration = Duration(milliseconds: 1500);
  
  /// Duration for button press animation
  static const Duration buttonPressDuration = Duration(milliseconds: 100);
  
  /// Duration for hover effects
  static const Duration hoverDuration = Duration(milliseconds: 200);
  
  /// Duration for typewriter character appearance
  static const Duration typewriterCharDuration = Duration(milliseconds: 50);
  
  /// Duration for cursor blink cycle
  static const Duration cursorBlinkDuration = Duration(milliseconds: 650);
  
  /// Duration for CRT flicker effect
  static const Duration crtFlickerDuration = Duration(milliseconds: 16); // ~60fps

  // ============ CRT EFFECT VALUES ============
  
  /// Scanline spacing in pixels
  static const double scanlineSpacing = 4.0;
  
  /// Scanline opacity
  static const double scanlineOpacity = 0.08;
  
  /// Vignette opacity at edges
  static const double vignetteOpacity = 0.28;
  
  /// CRT flicker intensity
  static const double crtFlickerIntensity = 0.02;

  // ============ RESPONSIVE BREAKPOINTS ============
  
  /// Tablet breakpoint width
  static const double tabletBreakpoint = 768.0;
  
  /// Mobile breakpoint width
  static const double mobileBreakpoint = 600.0;

  // ============ EXTERNAL LINKS ============
  
  /// GitHub profile URL
  static const String githubUrl = 'https://github.com/albatorresrodriguez';
  
  /// LinkedIn profile URL
  static const String linkedInUrl = 'https://linkedin.com/in/alba-torres-rodriguez';
  
  /// CV/Resume Google Docs URL
  static const String cvUrl = 'https://docs.google.com/document/d/13_7UvOE_gPIbA9gFBtiTanUEQJMbJ4H68kXFtysIX1Y/edit?usp=sharing';

  // ============ ASSET PATHS ============
  
  /// Path to custom icons directory
  static const String iconsPath = 'assets/images/';
  
  /// Path to doom icon
  static const String doomIconPath = '${iconsPath}doom-icon.png';
  
  /// Path to printer GIF icon
  static const String printerIconPath = '${iconsPath}printer-gif-icon.gif';
  
  /// Path to GitHub icon
  static const String githubIconPath = '${iconsPath}contact_github.png';
  
  /// Path to LinkedIn icon
  static const String linkedInIconPath = '${iconsPath}contact_in.png';
}



