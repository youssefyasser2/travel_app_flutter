# ✈️ Travel App - Modern Flutter Destination Guide

A premium, modern Flutter application designed for travelers to explore destinations, find budget tours, and plan their next holiday with a sleek, high-performance UI.

## ✨ Features

- **Immersive Onboarding**: A high-impact entry flow with premium imagery and smooth transitions.
- **Smart Destination Discovery**: 
  - Personalized greetings and location-aware header.
  - Advanced search with category filtering (Airport, Taxi, Hotel, etc.).
  - "Frequently Visited" carousel with interactive page indicators.
- **Budget Tour Planning**: Curated list of affordable tours with quick details on duration, location, and pricing.
- **Detailed Destination Insights**: 
  - Immersive full-screen image headers.
  - Floating content sheets with glassmorphism effects.
  - Interactive maps and review sections.
- **State-of-the-Art UI**: 
  - Dynamic SVG icon rendering.
  - Custom animations and soft elevations.
  - Pixel-perfect implementation matching high-fidelity design references.

## 🏗️ Architecture

The project follows a **Feature-Based Modular Architecture** (inspired by Clean Architecture principles) to ensure scalability and maintainability:

```text
lib/
├── core/               # Shared logic, themes, and global widgets
│   ├── constants/      # App assets and hardcoded strings
│   ├── theme/          # Centralized typography and color palettes
│   └── widgets/        # Reusable shared UI components
└── features/           # Self-contained business modules
    ├── home/           # Home screen logic, models, and UI
    ├── details/        # Destination detail views
    └── onboarding/     # App entry and introduction flow
```

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/) (latest stable)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: `ChangeNotifier` (Controller Pattern)
- **Asset Management**: `flutter_svg` for crisp, scalable iconography.
- **Styling**: Vanilla Flutter Custom Styles (no heavy external UI libraries for maximum control).

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Android Studio / VS Code with Flutter extensions
- An active Internet connection for pub dependencies

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/travel_app.git
   ```

2. **Navigate to the project directory**:
   ```bash
   cd travel_app
   ```

3. **Install dependencies**:
   ```bash
   flutter pub get
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

## 📸 Screenshots

| Onboarding | Home Screen | Details Page |
| :---: | :---: | :---: |
| ![Onboarding](https://via.placeholder.com/300x600?text=Onboarding) | ![Home](https://via.placeholder.com/300x600?text=Home+Screen) | ![Details](https://via.placeholder.com/300x600?text=Details+Page) |

---
*Created by Youssef for travelers everywhere.*
