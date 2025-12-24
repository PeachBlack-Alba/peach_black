# 🏗️ Architecture Documentation

## Overview

This project implements **CLEAN Architecture** principles with **BLoC pattern** for state management, following **SOLID** design principles throughout.

## Table of Contents

1. [Architecture Layers](#architecture-layers)
2. [SOLID Principles](#solid-principles)
3. [BLoC Pattern](#bloc-pattern)
4. [Folder Structure](#folder-structure)
5. [Data Flow](#data-flow)
6. [Design Patterns](#design-patterns)

---

## Architecture Layers

### 1. Presentation Layer (`lib/presentation/`)

**Responsibility**: Handle UI rendering and user interactions

**Components:**
- **Pages**: Full-screen views (MainPage, StartPage, PortfolioPage)
- **Widgets**: Reusable UI components (buttons, panels, windows)
- **BLoCs**: State management logic

**Key Characteristics:**
- No business logic
- Reactive to state changes
- Delegates actions to BLoCs via events
- Renders based on BLoC states

**Example:**
```dart
// Page listens to BLoC state
BlocBuilder<NavigationBloc, NavigationState>(
  builder: (context, state) {
    if (state is NavigationStartState) {
      return StartPage();
    }
    return PortfolioPage();
  },
)
```

### 2. Domain Layer (`lib/domain/`)

**Responsibility**: Business logic and entities

**Components:**
- **Entities**: Pure data models (WindowEntity)
- **Use Cases**: Business operations (if needed)
- **Repository Interfaces**: Contracts for data access (if needed)

**Key Characteristics:**
- Framework independent
- No UI dependencies
- Pure business logic
- Immutable entities with Equatable

**Example:**
```dart
class WindowEntity extends Equatable {
  final String id;
  final String title;
  final Offset position;
  // ... pure data, no Flutter dependencies
}
```

### 3. Core Layer (`lib/core/`)

**Responsibility**: Shared utilities and configuration

**Components:**
- **Constants**: App-wide configuration values
- **Theme**: Visual styling configuration
- **Utilities**: Helper functions (if needed)

**Key Characteristics:**
- Used by all other layers
- No business logic
- Configuration and utilities only

**Example:**
```dart
class AppConstants {
  static const Color accentColor = Color(0xFF4AF626);
  static const double spacingUnit = 8.0;
  // ... centralized configuration
}
```

---

## SOLID Principles

### Single Responsibility Principle (S)

**Each class has one reason to change.**

✅ **Good Example:**
```dart
// NavigationBloc: Only handles navigation state
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  // Handles navigation events only
}

// WindowManagementBloc: Only handles window state
class WindowManagementBloc extends Bloc<WindowManagementEvent, WindowManagementState> {
  // Handles window operations only
}
```

### Open/Closed Principle (O)

**Open for extension, closed for modification.**

✅ **Implementation:**
- Abstract event/state base classes allow easy extension
- New navigation states can be added without modifying existing code
- New window operations can be added via new events

```dart
// Easy to extend with new events
abstract class NavigationEvent extends Equatable {}
class NavigateToPortfolioEvent extends NavigationEvent {} // Existing
class NavigateToSettingsEvent extends NavigationEvent {} // New - no modification needed
```

### Liskov Substitution Principle (L)

**Subtypes must be substitutable for their base types.**

✅ **Implementation:**
- All NavigationState subclasses can be used wherever NavigationState is expected
- BlocBuilder handles all state types correctly

```dart
// All these states work with BlocBuilder<NavigationBloc, NavigationState>
NavigationStartState extends NavigationState {}
NavigationTransitioningState extends NavigationState {}
NavigationPortfolioState extends NavigationState {}
```

### Interface Segregation Principle (I)

**Clients shouldn't depend on interfaces they don't use.**

✅ **Implementation:**
- Separate BLoCs for different concerns (Navigation, WindowManagement)
- Widgets only depend on the BLoCs they actually need
- No "god" BLoC with all application state

```dart
// StartPage only needs NavigationBloc
class StartPage extends StatelessWidget {
  // Doesn't depend on WindowManagementBloc
}

// PortfolioPage needs WindowManagementBloc
class PortfolioPage extends StatelessWidget {
  // Only accesses WindowManagementBloc when needed
}
```

### Dependency Inversion Principle (D)

**Depend on abstractions, not concretions.**

✅ **Implementation:**
- Pages depend on abstract BLoC/Event/State interfaces
- Entities don't depend on Flutter framework
- Easy to swap implementations

```dart
// High-level widget depends on BLoC abstraction
BlocBuilder<NavigationBloc, NavigationState>( // Abstract types
  builder: (context, state) { /* ... */ }
)
```

---

## BLoC Pattern

### Why BLoC over Cubit?

1. **Explicit Events**: Clear intent of what triggered state change
2. **Event History**: Easier debugging with event stream
3. **Better Testing**: Can test event → state transitions
4. **Traceability**: Event logs show exact user actions

### BLoC Components

#### 1. Events
```dart
abstract class NavigationEvent extends Equatable {}
class NavigateToPortfolioEvent extends NavigationEvent {}
```
- Represent user actions or system triggers
- Immutable
- Use Equatable for efficient comparison

#### 2. States
```dart
abstract class NavigationState extends Equatable {}
class NavigationPortfolioState extends NavigationState {}
```
- Represent UI state at a point in time
- Immutable
- Use Equatable for rebuild optimization

#### 3. BLoC
```dart
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(InitialState()) {
    on<SomeEvent>(_onSomeEvent);
  }
}
```
- Maps events to states
- Contains business logic
- Emits new states

### BLoC Flow Diagram

```
┌──────────┐     ┌──────────┐     ┌──────────┐
│   User   │────▶│  Event   │────▶│   BLoC   │
│  Action  │     │          │     │          │
└──────────┘     └──────────┘     └─────┬────┘
                                        │
                                    Process
                                        │
                                        ▼
                                  ┌──────────┐
                                  │  State   │
                                  │          │
                                  └─────┬────┘
                                        │
                                        ▼
                                  ┌──────────┐
                                  │    UI    │
                                  │  Rebuild │
                                  └──────────┘
```

---

## Folder Structure

```
lib/
├── core/                           # Shared utilities and configuration
│   ├── constants/
│   │   └── app_constants.dart     # App-wide constants
│   └── theme/
│       └── app_theme.dart         # Theme configuration
│
├── domain/                         # Business logic layer
│   └── entities/
│       └── window_entity.dart     # Window data model
│
├── presentation/                   # UI layer
│   ├── bloc/                       # State management
│   │   ├── navigation/
│   │   │   ├── navigation_bloc.dart
│   │   │   ├── navigation_event.dart
│   │   │   ├── navigation_state.dart
│   │   │   └── navigation_barrel.dart
│   │   └── window_management/
│   │       ├── window_management_bloc.dart
│   │       ├── window_management_event.dart
│   │       ├── window_management_state.dart
│   │       └── window_management_barrel.dart
│   ├── pages/
│   │   ├── main_page.dart         # Root page with navigation
│   │   ├── start_page.dart        # Start/boot screen
│   │   └── portfolio_page.dart    # Main portfolio interface
│   └── widgets/
│       └── (reusable components)
│
├── ui/                             # UI components (being migrated)
│   ├── retro/                      # Retro-styled widgets
│   │   ├── crt_overlay.dart       # CRT screen effects
│   │   ├── retro_button.dart      # DOS-style button
│   │   ├── retro_panel.dart       # Double-bordered panel
│   │   ├── blinking_cursor.dart   # Animated cursor
│   │   ├── typewriter_text.dart   # Typewriter animation
│   │   └── code_panel.dart        # Terminal-style code display
│   ├── windows/                    # Window-related widgets
│   │   ├── retro_window.dart      # Draggable window
│   │   ├── about_window.dart      # About content
│   │   ├── work_window.dart       # Work/experience content
│   │   └── contact_window.dart    # Contact information
│   └── desktop/
│       └── desktop_icon.dart      # Desktop shortcut icon
│
├── apps/                           # External app integrations
│   ├── doom_app.dart              # DOOM game wrapper
│   ├── doom_app_web.dart          # Web-specific DOOM impl
│   └── doom_app_stub.dart         # Non-web fallback
│
├── screens/                        # Legacy screens (being refactored)
│   ├── start_screen.dart
│   └── portfolio_screen.dart
│
└── main.dart                       # App entry point
```

---

## Data Flow

### Navigation Flow

```
User clicks START button
        │
        ▼
StartPage dispatches NavigateToPortfolioEvent
        │
        ▼
NavigationBloc receives event
        │
        ├─▶ Emits NavigationTransitioningState
        │
        └─▶ Emits NavigationPortfolioState
                │
                ▼
        MainPage rebuilds with BlocBuilder
                │
                ▼
        Shows PortfolioPage with animation
```

### Window Management Flow

```
User clicks window icon (e.g., "About")
        │
        ▼
PortfolioScreen creates WindowEntity
        │
        ▼
Dispatches OpenWindowEvent(window)
        │
        ▼
WindowManagementBloc receives event
        │
        ├─▶ Checks if window already open
        │   ├─ Yes: Focus existing window
        │   └─ No: Add to openWindows list
        │
        └─▶ Emits new WindowManagementState
                │
                ▼
        PortfolioScreen rebuilds with BlocBuilder
                │
                ▼
        Renders all windows in correct z-order
```

---

## Design Patterns

### 1. BLoC Pattern
- **Purpose**: Separate business logic from UI
- **Location**: `lib/presentation/bloc/`
- **Benefit**: Testable, predictable state management

### 2. Entity Pattern
- **Purpose**: Immutable data models
- **Location**: `lib/domain/entities/`
- **Benefit**: Predictable, type-safe data

### 3. Adapter Pattern
- **Purpose**: Bridge old and new architecture during migration
- **Location**: `lib/presentation/pages/`
- **Example**: StartPage wraps StartScreen

### 4. Factory Pattern
- **Purpose**: Create complex objects (theme, constants)
- **Location**: `lib/core/`
- **Example**: AppTheme.darkTheme factory method

### 5. Observer Pattern
- **Purpose**: React to state changes
- **Implementation**: BlocBuilder, BlocListener
- **Benefit**: Reactive UI updates

---

## State Management Strategy

### Current BLoCs

#### NavigationBloc
**Purpose**: Manage screen navigation and transitions

**Events:**
- `NavigateToPortfolioEvent`: Go to portfolio
- `NavigateToStartEvent`: Return to start

**States:**
- `NavigationStartState`: On start screen
- `NavigationTransitioningState`: Animating transition
- `NavigationPortfolioState`: On portfolio screen

#### WindowManagementBloc
**Purpose**: Manage open windows, focus, and z-ordering

**Events:**
- `OpenWindowEvent`: Open/focus a window
- `CloseWindowEvent`: Close a window
- `FocusWindowEvent`: Bring window to front
- `UpdateWindowPositionEvent`: Move window
- `CloseAllWindowsEvent`: Close all windows

**States:**
- `WindowManagementState`: Contains list of open windows

---

## Testing Strategy

### Unit Tests
- Test BLoCs in isolation
- Verify event → state transformations
- Test entity equality and copyWith

### Widget Tests
- Test UI components render correctly
- Verify button interactions
- Test animation behaviors

### Integration Tests
- Test complete user flows
- Verify navigation works end-to-end
- Test window management scenarios

---

## Best Practices

### Code Organization
1. ✅ One class per file
2. ✅ Clear file and class naming
3. ✅ Comprehensive documentation
4. ✅ Consistent formatting
5. ✅ Meaningful variable names

### State Management
1. ✅ Events describe "what happened"
2. ✅ States describe "current situation"
3. ✅ BLoC contains logic, not UI
4. ✅ Use Equatable for efficient rebuilds
5. ✅ Keep states immutable

### Documentation
1. ✅ Every class has a doc comment
2. ✅ Public methods are documented
3. ✅ Complex logic has inline comments
4. ✅ Examples in documentation
5. ✅ Architecture docs (this file)

---

## Migration Path

This project is gradually migrating to CLEAN Architecture:

### Phase 1: ✅ Foundation (Completed)
- [x] Add flutter_bloc dependency
- [x] Create domain entities
- [x] Implement core BLoCs
- [x] Add constants and theme
- [x] Document architecture

### Phase 2: 🚧 In Progress
- [ ] Refactor screens to use BLoCs directly
- [ ] Improve widget documentation
- [ ] Add barrel files for cleaner imports
- [ ] Extract business logic from widgets

### Phase 3: 📋 Planned
- [ ] Add comprehensive tests
- [ ] Performance optimization
- [ ] Accessibility improvements
- [ ] Additional features

---

## Key Files

| File | Purpose | Layer |
|------|---------|-------|
| `main.dart` | App entry point, BLoC providers | Presentation |
| `app_constants.dart` | Centralized configuration | Core |
| `app_theme.dart` | Theme configuration | Core |
| `navigation_bloc.dart` | Navigation state management | Presentation |
| `window_management_bloc.dart` | Window state management | Presentation |
| `window_entity.dart` | Window data model | Domain |
| `main_page.dart` | Root navigation page | Presentation |

---

## Naming Conventions

### Files
- `snake_case.dart` for all Dart files
- `*_bloc.dart` for BLoC classes
- `*_event.dart` for event classes
- `*_state.dart` for state classes
- `*_entity.dart` for domain entities
- `*_page.dart` for full-screen pages

### Classes
- `PascalCase` for class names
- Descriptive names that explain purpose
- Suffix pattern: `*Bloc`, `*Event`, `*State`, `*Entity`

### Variables
- `camelCase` for variables and methods
- `_privateVariable` for private members
- Prefix with underscore for private
- Boolean variables start with `is`, `has`, `should`

### Constants
- `camelCase` for const values
- ALL_CAPS for compile-time constants in classes
- Descriptive names explaining purpose

---

## Performance Considerations

### Optimization Strategies

1. **Equatable for Efficient Rebuilds**
   - States and entities use Equatable
   - Prevents unnecessary widget rebuilds
   - Flutter only rebuilds when state actually changes

2. **Const Constructors**
   - Widgets use const where possible
   - Reduces object allocation
   - Better performance

3. **Animation Controllers**
   - Proper disposal to prevent memory leaks
   - Reuse controllers where possible
   - 60fps target for smooth animations

4. **BLoC Optimization**
   - States are immutable
   - Use `copyWith` for updates
   - List operations create new lists

---

## Future Enhancements

### Planned Improvements

1. **Repository Layer**
   - Add data persistence
   - Cache user preferences
   - Store window positions

2. **Use Cases Layer**
   - Extract complex business logic
   - Create reusable operations
   - Improve testability

3. **Dependency Injection**
   - Use GetIt or Injectable
   - Improve testability
   - Better separation of concerns

4. **Enhanced Testing**
   - 80%+ code coverage
   - Comprehensive widget tests
   - Integration test suite

---

## Resources

- [Flutter BLoC Documentation](https://bloclibrary.dev/)
- [CLEAN Architecture by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [SOLID Principles](https://en.wikipedia.org/wiki/SOLID)
- [Flutter Architecture Samples](https://github.com/brianegan/flutter_architecture_samples)

---

**Last Updated**: December 24, 2025  
**Version**: 1.0.0  
**Author**: Alba Torres Rodríguez



