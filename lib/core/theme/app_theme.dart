import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Application theme configuration following 90's DOS aesthetic
/// 
/// Provides centralized theme management with retro styling including:
/// - VT323 monospace font
/// - CRT-style text shadows
/// - Dark color scheme with neon green accents
/// - Consistent typography across all text styles
/// 
/// **Usage:**
/// ```dart
/// MaterialApp(theme: AppTheme.darkTheme)
/// ```
class AppTheme {
  // Prevent instantiation
  AppTheme._();

  /// Main dark theme with retro DOS styling
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppConstants.backgroundColor,
      
      // Color scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppConstants.accentColor,
        brightness: Brightness.dark,
        primary: AppConstants.accentColor,
        secondary: AppConstants.primaryTextColor,
        background: AppConstants.backgroundColor,
        surface: AppConstants.backgroundColor,
        error: AppConstants.errorColor,
      ),
      
      // Typography with VT323 font and CRT shadows
      fontFamily: AppConstants.fontFamily,
      textTheme: _buildTextTheme(),
      
      // Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.backgroundColor,
          foregroundColor: AppConstants.primaryTextColor,
          side: const BorderSide(
            color: AppConstants.borderColor,
            width: AppConstants.borderWidth,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Sharp corners for retro look
          ),
          textStyle: const TextStyle(
            fontFamily: AppConstants.fontFamily,
            shadows: AppConstants.textShadow,
          ),
        ),
      ),
      
      // AppBar theme (if needed)
      appBarTheme: const AppBarTheme(
        backgroundColor: AppConstants.backgroundColor,
        foregroundColor: AppConstants.primaryTextColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: AppConstants.fontFamily,
          fontSize: 22,
          color: AppConstants.primaryTextColor,
          shadows: AppConstants.textShadow,
        ),
      ),
    );
  }

  /// Builds complete text theme with VT323 font and CRT shadows
  /// 
  /// All text styles include:
  /// - VT323 retro monospace font
  /// - 1px black text shadow for CRT effect
  /// - White color for high contrast
  static TextTheme _buildTextTheme() {
    const baseStyle = TextStyle(
      fontFamily: AppConstants.fontFamily,
      color: AppConstants.primaryTextColor,
      shadows: AppConstants.textShadow,
    );

    return TextTheme(
      // Display styles (largest text)
      displayLarge: baseStyle.copyWith(fontSize: 59),
      displayMedium: baseStyle.copyWith(fontSize: 47),
      displaySmall: baseStyle.copyWith(fontSize: 38),
      
      // Headline styles (headers)
      headlineLarge: baseStyle.copyWith(fontSize: 34),
      headlineMedium: baseStyle.copyWith(fontSize: 30),
      headlineSmall: baseStyle.copyWith(fontSize: 26),
      
      // Title styles (section titles)
      titleLarge: baseStyle.copyWith(fontSize: 24),
      titleMedium: baseStyle.copyWith(fontSize: 18),
      titleSmall: baseStyle.copyWith(fontSize: 16),
      
      // Body styles (main content)
      bodyLarge: baseStyle.copyWith(fontSize: 18),
      bodyMedium: baseStyle.copyWith(fontSize: 16),
      bodySmall: baseStyle.copyWith(fontSize: 14),
      
      // Label styles (buttons, labels)
      labelLarge: baseStyle.copyWith(fontSize: 16),
      labelMedium: baseStyle.copyWith(fontSize: 14),
      labelSmall: baseStyle.copyWith(fontSize: 13),
    );
  }
}
