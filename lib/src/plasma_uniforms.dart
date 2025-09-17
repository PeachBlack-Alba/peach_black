/// Constants for shader uniform indices.
/// 
/// These indices must match the layout locations in the fragment shader.
/// The order is critical for proper shader communication.
class PlasmaUniforms {
  /// Resolution X component (float at index 0)
  static const int iResolutionX = 0;
  
  /// Resolution Y component (float at index 1)  
  static const int iResolutionY = 1;
  
  /// Time in seconds (float at index 2)
  static const int iTime = 2;
  
  /// Custom color red component (float at index 3)
  static const int uCustomColorR = 3;
  
  /// Custom color green component (float at index 4)
  static const int uCustomColorG = 4;
  
  /// Custom color blue component (float at index 5)
  static const int uCustomColorB = 5;
  
  /// Use custom color flag (float at index 6, 0.0 or 1.0)
  static const int uUseCustomColor = 6;
  
  /// Animation speed multiplier (float at index 7)
  static const int uSpeed = 7;
  
  /// Direction multiplier (float at index 8, -1.0 to 1.0)
  static const int uDirection = 8;
  
  /// Scale/zoom factor (float at index 9)
  static const int uScale = 9;
  
  /// Opacity multiplier (float at index 10, 0.0 to 1.0)
  static const int uOpacity = 10;
  
  /// Mouse X coordinate (float at index 11)
  static const int uMouseX = 11;
  
  /// Mouse Y coordinate (float at index 12)
  static const int uMouseY = 12;
  
  /// Mouse interactive flag (float at index 13, 0.0 or 1.0)
  static const int uMouseInteractive = 13;
  
  /// Total number of uniform slots used
  static const int totalUniforms = 14;
}