# PRODUCT CATALOG

### OVERVIEW
Some useful documentation related to the project committed by Scalapay as home assignment.

### TECH STACK
This project uses the current main technologies stack:
- **FPDart** for functional programming
- **Cubit + Bloc** as state management
- **Dio** as HTTP client
- **GetIt** for the dependency injection

### PROJECT STRUCTURE
```
.
├── app                 # Application entrypoint          
├── assets              # Application assets (fonts, images, icons)
├── core                # Core infrastructure and design system
│   ├── di              # Dependency injection
│   ├── error           # Application errors
│   ├── network         # Network related stuff (e.g. client initialization)
│   ├── ui              # Design system
│   │   ├── theme       # Application theme
│   │   └── widgets     # Application widgets
│   └── utils           # Application utils such as constants, etc... 
├── l10n                # Translations
├── layers              # Feature layers (Clean Architecture)
│   ├── data            # API-related implementations
│   │   ├── datasource  # Remote data sources (e.g. HTTP)
│   │   ├── mapper      # Converts API models to domain
│   │   ├── model       # API response models (DTOs)
│   │   └── repository  # Implements domain repositories
│   ├── domain          # Business logic
│   │   ├── model       # Domain-level models used by use cases and presentation
│   │   ├── repository  # Abstract contracts for data access
│   │   └── use_case    # Reusable business logic units
│   └── presentation    # UI and state management (Cubit)
│       └── model       # View-specific models (e.g. enums, filters)
└── main.dart           # Main file (starting)
```

### GETTING STARTED
To run the app locally:

```bash
flutter pub get
flutter run
```

### IMPORT SORTER
To run the import sorter type:
```shell
flutter pub run import_sorter:main
```

### BUILD RUNNER
To run the build runner and generate auto-code (e.g. JSON serializer) type:
```shell
flutter pub run build_runner build --delete-conflicting-outputs
```

### TESTS
To run all the tests:
```shell
flutter test
```

---
📄 This project was developed as a home assignment for Scalapay.

© 2025 Mounir El Omri. All rights reserved.
This code is not intended for redistribution or commercial use outside the context of the selection process.
---
