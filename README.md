# Tomari Flutter Starter

A refined Flutter starter template focused on **scalability**, **clean architecture**, and **developer ergonomics**.

---

## 📦 Project Overview

This starter pack provides a solid foundation for Flutter apps, emphasizing:

- **Modular folder structure** with a clear separation of concerns
- Centralized **constants** for API, assets, preferences, and routes
- Handy **Dart extensions** for UI padding, sized boxes, strings, and context
- A powerful **ApiService** built on Dio with explicit error handling using a sealed result class
- Useful utilities like a **logger** and an API call handler (`handleApiCall`) to streamline your business logic
- No opinionated state management — use whatever fits your project best

---

## 🗂 Folder Structure

```

lib/
├── application/
│   ├── constants/
│   ├── extensions/
│   └── services/
├── utils/
└── main.dart

```

- `application` contains your app’s core logic, including constants, extensions, and services
- `utils` has helpers like logger and API call handling utilities
- Features should be organized in modular folders under `lib/features` (you can add as needed)

---

## 🚀 Getting Started

1. **Clone the repo**

```bash
git clone https://github.com/thetmyoekhaing/tomari-flutter-starter.git
cd tomari-flutter-starter
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Run the app**

```bash
flutter run
```

---

## ⚙️ Key Components

### Constants

Centralized constants help maintain your API endpoints, asset paths, and navigation routes.

### Extensions

Fluent API extensions simplify your UI code:

- `context_ext.dart` for easy navigation and theming
- `padding_ext.dart` for padding shortcuts
- `sb_ext.dart` for quick `SizedBox` widgets like `16.height`
- `string_ext.dart` for common string operations

### ApiService

A Dio wrapper that provides clean, intention-revealing HTTP methods and enforces explicit success/failure handling.

### Utilities

- **Logger:** A wrapper around the `logger` package for consistent, readable logs
- **handleApiCall:** A helper function that manages API call results, keeping business logic clean

---

## 💡 Why Use This Starter?

- Saves setup time with a ready-made architecture
- Encourages clean and maintainable code
- Flexible — works with any state management solution
- Includes practical utilities for common development needs

---

## 🤝 Contribution

Feel free to fork, suggest improvements, or add features. Pull requests and issues are welcome!

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

## 🙌 Acknowledgments

Inspired by community best practices and real-world app requirements. Thanks for checking it out!

---

If you find this starter useful, please ⭐ the repo!

---

**Happy Fluttering!** 🚀

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
