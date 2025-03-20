# E-Commerce Flutter App

A Flutter e-commerce application built with Feature-Sliced Design architecture and Riverpod state management.

## Features

- Product catalog with pagination
- Search and filtering capabilities
- Product details view
- Shopping cart functionality
- Persistent cart storage
- Clean architecture implementation

## Technical Stack

- Flutter
- Riverpod (State Management)
- Feature-Sliced Design (Architecture)
- Go Router (Navigation)
- HTTP (API Client)
- Shared Preferences (Local Storage)
- Freezed (Code Generation)

## Project Structure

```
lib/
├── app/                 # Application layer
│   ├── providers/      # Global providers
│   ├── router/         # Navigation configuration
│   └── theme/          # App theme configuration
├── features/           # Feature modules
│   ├── cart/          # Shopping cart feature
│   ├── catalog/       # Product catalog feature
│   └── product/       # Product details feature
├── shared/            # Shared modules
│   ├── api/          # API client and models
│   ├── config/       # App configuration
│   ├── models/       # Shared models
│   └── widgets/      # Shared widgets
└── main.dart         # Application entry point
```

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/e_commerce.git
```

2. Navigate to the project directory:
```bash
cd e_commerce
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

### Development

To generate code (models, providers):
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Testing

Run tests:
```bash
flutter test
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
