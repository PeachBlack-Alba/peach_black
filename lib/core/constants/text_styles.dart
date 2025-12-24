import 'package:flutter/material.dart';
import 'app_constants.dart';

/// Predefined text styles for consistent typography throughout the app
/// 
/// This class provides ready-to-use [TextStyle] instances that follow
/// the retro DOS aesthetic with VT323 font and CRT shadows.
/// 
/// **Usage:**
/// ```dart
/// Text('Hello', style: AppTextStyles.body)
/// Text('Title', style: AppTextStyles.heading)
/// ```
/// 
/// **Benefits:**
/// - Single source of truth for text styling
/// - Consistent look across all screens
/// - Easy to update globally
/// - Follows DRY principle
/// 
/// **Categories:**
/// - Headings: Large display text for titles
/// - Body: Standard content text
/// - Labels: Small text for buttons and labels
/// - Special: Unique styles (code, mono, etc.)
class AppTextStyles {
  // Prevent instantiation
  AppTextStyles._();

  // ============ BASE STYLE ============
  
  /// Base text style with retro font and CRT shadow
  /// 
  /// All other styles extend from this base to ensure consistency.
  static const TextStyle _baseStyle = TextStyle(
    fontFamily: AppConstants.fontFamily,
    color: AppConstants.primaryTextColor,
    shadows: AppConstants.textShadow,
  );

  // ============ HEADINGS ============
  
  /// Extra large heading (50px) - for main titles
  /// 
  /// Use for: Screen titles, splash screens, hero text
  static const TextStyle headingXLarge = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: AppConstants.primaryTextColor,
    shadows: AppConstants.textShadow,
  );

  /// Large heading (38px) - for section titles
  /// 
  /// Use for: Section headers, window titles
  static const TextStyle headingLarge = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: AppConstants.primaryTextColor,
    shadows: AppConstants.textShadow,
  );

  /// Medium heading (30px) - for subsection titles
  /// 
  /// Use for: Subsection headers, card titles
  static const TextStyle headingMedium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppConstants.primaryTextColor,
    shadows: AppConstants.textShadow,
  );

  /// Small heading (26px) - for minor headings
  /// 
  /// Use for: List headers, dialog titles
  static const TextStyle headingSmall = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppConstants.primaryTextColor,
    shadows: AppConstants.textShadow,
  );

  // ============ BODY TEXT ============
  
  /// Large body text (22px) with proper line height
  /// 
  /// Use for: Main content, paragraphs, descriptions
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 22,
    color: AppConstants.primaryTextColor,
    height: 1.5,
    shadows: AppConstants.textShadow,
  );

  /// Medium body text (20px) - standard body
  /// 
  /// Use for: Standard content, list items
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 20,
    color: AppConstants.primaryTextColor,
    height: 1.5,
    shadows: AppConstants.textShadow,
  );

  /// Small body text (18px) - compact content
  /// 
  /// Use for: Dense content, secondary text
  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 18,
    color: AppConstants.primaryTextColor,
    height: 1.5,
    shadows: AppConstants.textShadow,
  );

  // ============ LABELS & UI ELEMENTS ============
  
  /// Button label text (20px)
  /// 
  /// Use for: Button text, action labels
  static const TextStyle button = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppConstants.primaryTextColor,
    shadows: AppConstants.textShadow,
  );

  /// Window title bar text (18px)
  /// 
  /// Use for: Window title bars, dialog headers
  static const TextStyle windowTitle = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppConstants.primaryTextColor,
    shadows: AppConstants.textShadow,
  );

  /// Small label text (16px)
  /// 
  /// Use for: Form labels, small UI text
  static const TextStyle label = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 16,
    color: AppConstants.primaryTextColor,
    shadows: AppConstants.textShadow,
  );

  /// Extra small label (14px)
  /// 
  /// Use for: Hints, captions, footnotes
  static const TextStyle caption = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 14,
    color: AppConstants.secondaryTextColor,
    shadows: AppConstants.textShadow,
  );

  // ============ SPECIAL STYLES ============
  
  /// Monospace code text (18px)
  /// 
  /// Use for: Code snippets, terminal output, technical text
  static const TextStyle code = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 18,
    color: AppConstants.accentColor,
    height: 1.4,
    shadows: AppConstants.textShadow,
  );

  /// Terminal/console text (20px)
  /// 
  /// Use for: Command line interfaces, DOS prompts
  static const TextStyle terminal = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 20,
    color: AppConstants.accentColor,
    height: 1.3,
    shadows: AppConstants.textShadow,
  );

  /// Typewriter animation text (16px)
  /// 
  /// Use for: Boot sequences, loading text, typewriter effects
  static const TextStyle typewriter = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 16,
    color: AppConstants.primaryTextColor,
    shadows: AppConstants.textShadow,
  );

  /// Link text with accent color
  /// 
  /// Use for: Hyperlinks, clickable text
  static const TextStyle link = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 20,
    color: AppConstants.accentColor,
    decoration: TextDecoration.underline,
    decorationColor: AppConstants.accentColor,
    shadows: AppConstants.textShadow,
  );

  /// Error/warning text
  /// 
  /// Use for: Error messages, validation errors
  static const TextStyle error = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 18,
    color: AppConstants.errorColor,
    shadows: AppConstants.textShadow,
  );

  // ============ ACCENT COLOR VARIANTS ============
  
  /// Accent colored body text
  /// 
  /// Use for: Highlighted content, important text
  static const TextStyle bodyAccent = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 20,
    color: AppConstants.accentColor,
    height: 1.5,
    shadows: AppConstants.textShadow,
  );

  /// Accent colored heading
  /// 
  /// Use for: Important titles, highlighted headers
  static const TextStyle headingAccent = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppConstants.accentColor,
    shadows: AppConstants.textShadow,
  );

  // ============ HELPER METHODS ============
  
  /// Creates a copy of a text style with different color
  /// 
  /// **Example:**
  /// ```dart
  /// Text('Red text', style: AppTextStyles.withColor(AppTextStyles.body, Colors.red))
  /// ```
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  /// Creates a copy of a text style with different font size
  /// 
  /// **Example:**
  /// ```dart
  /// Text('Large', style: AppTextStyles.withSize(AppTextStyles.body, 24))
  /// ```
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }

  /// Creates a copy of a text style with bold weight
  /// 
  /// **Example:**
  /// ```dart
  /// Text('Bold', style: AppTextStyles.bold(AppTextStyles.body))
  /// ```
  static TextStyle bold(TextStyle style) {
    return style.copyWith(fontWeight: FontWeight.bold);
  }
}

