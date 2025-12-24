# 🎮 Retro DOS Portfolio - Alba Torres Rodríguez

A 90's DOS-style portfolio built with Flutter, featuring authentic CRT effects, draggable windows, and playable retro games (DOOM!).

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)
![Architecture](https://img.shields.io/badge/Architecture-CLEAN-green)
![State Management](https://img.shields.io/badge/State-BLoC-blue)

## ✨ Features

- 🖥️ **Authentic 90's DOS Aesthetic**: CRT effects, scanlines, vignette, and retro fonts
- 🪟 **Draggable Retro Windows**: Multiple windows with focus management and z-ordering
- ⌨️ **Typewriter Animations**: Character-by-character text rendering
- 🎮 **Playable DOOM**: Run DOOM shareware via js-dos emulation
- 📱 **Responsive Design**: Works on desktop and mobile devices
- 🎯 **Clean Architecture**: SOLID principles with BLoC pattern

## 🏗️ Architecture

This project follows **CLEAN Architecture** principles with clear separation of concerns:

```
lib/
├── core/                   # Core functionality
│   ├── constants/          # App-wide constants
│   └── theme/              # Theme configuration
│
├── domain/                 # Business logic layer
│   └── entities/           # Domain entities (WindowEntity, etc.)
│
├── presentation/           # UI layer
│   ├── bloc/               # State management (BLoC pattern)
│   │   ├── navigation/     # Navigation BLoC
│   │   └── window_management/ # Window state BLoC
│   ├── pages/              # Full-screen pages
│   └── widgets/            # Reusable UI components
│
├── apps/                   # External app integrations (DOOM)
├── screens/                # Legacy screens (being refactored)
└── ui/                     # UI components
    ├── retro/              # Retro-styled widgets
    ├── windows/            # Window content widgets
    └── desktop/            # Desktop icons and elements
```

### Key Architectural Decisions

1. **BLoC Pattern**: Used for state management instead of Cubit for more explicit event handling
2. **Entity Separation**: Domain entities are isolated from UI concerns
3. **Single Responsibility**: Each class has one clear purpose
4. **Dependency Inversion**: High-level modules don't depend on low-level details
5. **Open/Closed Principle**: Easy to extend without modifying existing code

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.0 or higher
- Dart SDK 3.0 or higher
- FVM (Flutter Version Management) - optional but recommended

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/albatorresrodriguez/peach_black.git
cd peach_black
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
# For web
flutter run -d chrome

# For desktop (macOS)
flutter run -d macos

# For mobile
flutter run
```

### Building for Production

```bash
# Web
flutter build web --release

# macOS
flutter build macos --release

# iOS
flutter build ios --release

# Android
flutter build apk --release
```

## 📦 Dependencies

### State Management
- **flutter_bloc** (^8.1.3): BLoC pattern implementation
- **equatable** (^2.0.5): Value equality for entities and states

### Graphics & UI
- **flutter_shaders** (^0.1.2): Custom plasma background shader

### External Integration
- **url_launcher** (^6.3.1): Open external links (CV, GitHub, LinkedIn)

## 🎨 Design System

### Colors
- **Accent Color**: `#4AF626` (Neon green)
- **Background**: `#000000` (Pure black)
- **Text**: `#FFFFFF` (White with CRT shadow)
- **Borders**: `#FFFFFF` (White, 2px)

### Typography
- **Font**: VT323 (Retro monospace terminal font)
- **Shadow**: 1px offset black shadow for CRT effect

### Spacing
- Uses 8px grid system for consistent spacing
- **Small**: 8px
- **Medium**: 16px
- **Large**: 24px
- **XLarge**: 32px

## 🎮 DOOM Integration

The portfolio includes a playable version of DOOM shareware via js-dos emulation:

1. **Location**: `web/doom/` directory
2. **Engine**: js-dos v7 (DOSBox in browser)
3. **Bundle**: Pre-installed DOOM shareware (5.3MB)
4. **Controls**: 
   - Arrow keys: Move
   - Ctrl: Fire
   - Alt: Strafe
   - Space: Use/Open doors
   - ESC: Menu

### Technical Details
- DOOM runs in an iframe isolated from the Flutter app
- Assets are served locally (no CDN dependencies)
- Custom `locateFile` configuration for WASM loading
- Mobile fallback with touch controls

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/widget_test.dart
```

## 🔧 Configuration

### Constants
All configurable values are centralized in `lib/core/constants/app_constants.dart`:

- Colors and themes
- Animation durations
- Window sizes
- CRT effect parameters
- External URLs
- Asset paths

### Theme
Theme configuration is in `lib/core/theme/app_theme.dart`:

- Typography settings
- Button styles
- AppBar theme
- Text shadows

## 📱 Responsive Breakpoints

- **Desktop**: > 768px
- **Tablet**: 600px - 768px
- **Mobile**: < 600px

## 🤝 Contributing

This is a personal portfolio project, but suggestions and feedback are welcome!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is for portfolio purposes. Feel free to use it as inspiration for your own projects!

## 👤 Author

**Alba Torres Rodríguez**
- GitHub: [@albatorresrodriguez](https://github.com/albatorresrodriguez)
- LinkedIn: [alba-torres-rodriguez](https://linkedin.com/in/alba-torres-rodriguez)
- Portfolio: [Live Demo](https://albatorresrodriguez.github.io/peach_black)

## 🙏 Acknowledgments

- **VT323 Font**: Google Fonts
- **js-dos**: [@caiiiycuk](https://github.com/caiiiycuk)
- **DOOM**: id Software
- **Flutter Community**: For amazing packages and support

## 📝 Project Status

🚧 **Active Development** - This project is continuously being improved and refactored to follow best practices.

### Recent Updates
- ✅ Migrated to CLEAN Architecture
- ✅ Implemented BLoC pattern for state management
- ✅ Added comprehensive documentation
- ✅ Fixed DOOM integration
- ✅ Improved code organization and naming

### Roadmap
- [ ] Complete refactoring of legacy screens
- [ ] Add unit tests for BLoCs
- [ ] Add widget tests for UI components
- [ ] Implement additional retro games
- [ ] Add sound effects
- [ ] Improve mobile experience
- [ ] Add accessibility features

---

Made with 💚 and Flutter by Alba Torres Rodríguez
