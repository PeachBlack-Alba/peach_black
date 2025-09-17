/// Direction of the plasma animation.
enum PlasmaDirection {
  /// Animation moves forward in time (positive direction).
  forward,
  
  /// Animation moves backward in time (negative direction).
  reverse,
  
  /// Animation oscillates between forward and reverse using a sine wave.
  pingpong,
}

/// Extension to convert PlasmaDirection to shader direction value.
extension PlasmaDirectionValue on PlasmaDirection {
  /// Converts the direction enum to a direction multiplier for the shader.
  /// 
  /// For [forward] and [reverse], returns a constant value.
  /// For [pingpong], the actual value should be computed as sin(time * 0.5).
  double get baseValue {
    switch (this) {
      case PlasmaDirection.forward:
        return 1.0;
      case PlasmaDirection.reverse:
        return -1.0;
      case PlasmaDirection.pingpong:
        return 1.0; // Will be modulated by sin(time * 0.5) in the painter
    }
  }
}