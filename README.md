# Plasma Background

A Flutter widget that renders a real-time plasma background using fragment shaders, replicating the behavior and API of React + OGL plasma components.

![Plasma Background Demo](https://via.placeholder.com/600x300/6B46C1/FFFFFF?text=Plasma+Background+Demo)

## Features

- 🎨 **Customizable Colors**: Full color control with intensity-based tinting
- ⚡ **High Performance**: Hardware-accelerated fragment shader rendering
- 🎮 **Interactive**: Mouse/touch interaction affects plasma flow
- 📱 **Cross-Platform**: Works on iOS, Android, macOS, Windows, Linux, and Web (CanvasKit)
- 🎛️ **Flexible API**: Multiple animation directions and parameters
- 🔄 **Smooth Animation**: 60fps with proper vsync handling

## Quick Start

### 1. Add to pubspec.yaml

```yaml
dependencies:
  flutter:
    sdk: flutter

flutter:
  shaders:
    - assets/shaders/plasma.frag
```

### 2. Copy the shader file

Copy `assets/shaders/plasma.frag` to your project's `assets/shaders/` directory.

### 3. Basic usage

```dart
import 'package:flutter/material.dart';
import 'plasma_background.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PlasmaBackground(
            color: Color(0xFFFF6B35),
            speed: 0.6,
            direction: PlasmaDirection.forward,
            scale: 1.1,
            opacity: 0.8,
            mouseInteractive: true,
          ),
          // Your UI content here
          Center(
            child: Text(
              'Hello, Plasma!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

## API Reference

### PlasmaBackground

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `color` | `Color` | `Colors.white` | Color used to tint the plasma effect |
| `speed` | `double` | `1.0` | Animation speed multiplier |
| `direction` | `PlasmaDirection` | `forward` | Animation direction |
| `scale` | `double` | `1.0` | Scale/zoom factor (>1.0 zooms in) |
| `opacity` | `double` | `1.0` | Opacity of the effect (0.0-1.0) |
| `mouseInteractive` | `bool` | `true` | Enable mouse/touch interaction |
| `fit` | `BoxFit` | `cover` | How to fit within available space |
| `lowPowerMode` | `bool` | `false` | Reduce iterations for better performance |

### PlasmaDirection

- `PlasmaDirection.forward` - Normal forward animation
- `PlasmaDirection.reverse` - Reversed animation
- `PlasmaDirection.pingpong` - Oscillating animation using sin(time * 0.5)

## Advanced Usage

### Custom Colors

```dart
// Use a custom color
PlasmaBackground(color: Color(0xFF6B46C1))

// Show native plasma colors
PlasmaBackground(color: Colors.transparent)
```

### Animation Control

```dart
// Fast forward animation
PlasmaBackground(
  speed: 2.0,
  direction: PlasmaDirection.forward,
)

// Slow pingpong animation
PlasmaBackground(
  speed: 0.3,
  direction: PlasmaDirection.pingpong,
)
```

### As a Background Layer

```dart
SizedBox(
  width: double.infinity,
  height: 600,
  child: Stack(
    children: [
      PlasmaBackground(
        color: Color(0xFFFF6B35),
        opacity: 0.7, // Semi-transparent
      ),
      // Your content here
      YourContentWidget(),
    ],
  ),
)
```

## Platform Support

### Web Requirements

This widget requires **CanvasKit** renderer for web. Add to your `web/index.html`:

```html
<script>
  window.flutterConfiguration = {
    canvasKitBaseUrl: "https://unpkg.com/canvaskit-wasm@0.37.2/bin/",
    renderer: "canvaskit",
  };
</script>
```

### Mobile Performance

On lower-end devices, you can enable low-power mode:

```dart
PlasmaBackground(
  lowPowerMode: true, // Reduces shader iterations
)
```

## Technical Details

### Shader Uniforms

The fragment shader receives uniforms in this order:

| Index | Name | Type | Description |
|-------|------|------|-------------|
| 0-1 | `iResolution` | vec2 | Screen resolution in pixels |
| 2 | `iTime` | float | Time in seconds |
| 3-5 | `uCustomColor` | vec3 | RGB color (0.0-1.0, linearized) |
| 6 | `uUseCustomColor` | float | Whether to use custom color (0.0/1.0) |
| 7 | `uSpeed` | float | Speed multiplier |
| 8 | `uDirection` | float | Direction value (-1.0 to 1.0) |
| 9 | `uScale` | float | Scale factor |
| 10 | `uOpacity` | float | Opacity multiplier |
| 11-12 | `uMouse` | vec2 | Mouse position in local coordinates |
| 13 | `uMouseInteractive` | float | Mouse interaction enabled (0.0/1.0) |

### Color Space

Input colors are converted from sRGB to linear space before passing to the shader:

```dart
double linearizeColor(double srgb) {
  return srgb <= 0.04045 
    ? srgb / 12.92 
    : pow((srgb + 0.055) / 1.055, 2.4);
}
```

### Performance Considerations

- Uses `RepaintBoundary` to minimize repaints
- Shader uniforms are clamped to safe ranges
- Time is driven by `Ticker` with proper vsync
- Device pixel ratio is handled correctly

## Troubleshooting

### Common Issues

**Shader not loading:**
- Ensure `assets/shaders/plasma.frag` is in your pubspec.yaml under `flutter.shaders`
- Check that the shader file is copied to the correct location

**Poor performance on web:**
- Make sure you're using CanvasKit renderer, not HTML renderer
- Consider enabling `lowPowerMode` for complex layouts

**Black screen:**
- Verify your shader compiles without errors
- Check browser/device WebGL support
- Ensure proper uniform values are being passed

**Mouse interaction not working:**
- Verify `mouseInteractive` is set to `true`
- Check that the widget has proper size constraints
- On mobile, touch events are treated as mouse events

## Examples

Run the example app to see all features in action:

```bash
cd example
flutter run
```

The example includes:
- Interactive controls for all parameters
- Color picker with preset colors
- Real-time parameter adjustment
- Performance monitoring

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please read the contributing guidelines before submitting PRs.

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## Acknowledgments

- Inspired by the React + OGL plasma component
- Fragment shader based on classic plasma effects
- Built with Flutter's powerful shader system