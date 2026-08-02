# MediCare+ - Smart Personal Healthcare Companion

**Your Personal Smart Healthcare Companion**

MediCare+ is a production-quality Flutter healthcare application featuring Material Design 3, a reusable design system, responsive layouts, Riverpod state management, and a scalable MVVM-ready architecture.

---

## 🎯 Overview
MediCare+ aims to be an all-in-one healthcare management solution. Users can track their health progress, manage medications, schedule appointments, review medical reports, and get AI-assisted guidance. 

## 🏗️ Architecture & Folder Structure

The project follows a modular MVVM (Model-View-ViewModel) architecture ensuring scalability, testability, and clean code separation.

```text
lib/
├── core/
│   ├── constants/    # App-wide values (colors, spacing, names, tokens)
│   ├── themes/       # Material 3 light/dark themes, typography, component styles
│   ├── utils/        # Shared helper functions, formatters, extensions
│   └── services/     # Wrappers for external APIs (Firebase, local storage, notifications)
├── models/           # Domain and DTO models, strongly typed data objects
├── providers/        # Riverpod dependency injection and global state management
├── repositories/     # Data access abstractions for CRUD operations
├── routes/           # Named navigation paths and route configuration
├── viewmodels/       # MVVM state controllers connecting views to repositories
├── views/            # Feature-specific screens (auth, dashboard, medicine, etc.)
└── widgets/          # Reusable UI components shared across multiple screens
```

## 🛠️ Technology Stack & Dependencies

- **Framework:** Flutter SDK (`^3.12.2`)
- **State Management:** `flutter_riverpod` (`^3.0.3`) for predictable, scalable state management.
- **Typography:** `google_fonts` (`^6.3.2`) specifically using "Inter" for a clean, premium look.
- **Icons:** `cupertino_icons` (`^1.0.8`) & Material Icons (`uses-material-design: true`).
- **Code Quality:** `flutter_lints` (`^6.0.0`) for strictly enforcing best practices.

## 🚀 Current Features (Phase 1)

The initial foundation of the application has been laid out focusing on UI and structural readiness:

- **Design System:** Comprehensive tokens for colors, spacing, radii, and shadows tailored for healthcare.
- **Theming:** Full Material 3 Light & Dark mode support built around the Inter font family.
- **Navigation Shell:** A responsive five-tab authenticated shell encompassing Home, Medicines, Appointments, Reports, and Profile.
- **Home Dashboard:** Features a health score overview, interactive progress cards, quick action buttons, appointment previews, and daily health tips.
- **State Setup:** Core Riverpod app scope configuration and root tab state.
- **Scalable Foundation:** Stubbed and professional placeholders ready for complex module integration.

## 🚧 Upcoming Features & Firebase Setup Roadmap

Firebase integration will follow feature-by-feature as the UI foundation is solidified:

1. **Project Setup:** Initialize Firebase for Android and iOS via FlutterFire CLI.
2. **Authentication:** Implement Firebase Auth (Login, Registration, Email Verification, Password Reset).
3. **Firestore Database:** 
   - Users profiles and preferences.
   - Medicines and schedules.
   - Appointments and doctors.
   - Vital logs and daily health tips.
4. **Cloud Storage:** Support for profile pictures and medical report uploads (PDFs/Images).
5. **Notifications:** Firebase Cloud Messaging (FCM) for medication reminders and appointment alerts.
6. **Advanced Features:** 
   - Water reminder, BMI calculator, and Emergency SOS.
   - AI-powered symptom checker (safe, non-diagnostic guidance).
   - OCR capabilities for prescription reading and barcode scanning.

## 💻 Installation & Setup

1. **Clone the repository.**
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the application:**
   ```bash
   flutter run
   ```

## 📸 Screenshots

*(Add screenshots here as production features are completed)*

- `docs/screenshots/home-dashboard.png`
- `docs/screenshots/medicines.png`
- `docs/screenshots/appointments.png`
- `docs/screenshots/reports.png`
- `docs/screenshots/profile.png`

## 📦 Deployment Guide (Pre-flight Checklist)

Before releasing to production or publishing to app stores:

1. Run `flutter analyze` and ensure zero warnings.
2. Run all unit and widget tests: `flutter test`.
3. Configure actual app icons and native splash screens.
4. Verify Android package name, iOS bundle identifier, app versioning in `pubspec.yaml`, and signing configurations.
5. Deploy and validate Firebase Security Rules.
6. Test UI responsiveness across diverse screen sizes (phones, tablets) and orientations.
7. Build for production:
   - Android: `flutter build appbundle`
   - iOS: `flutter build ipa`

---
*Developed with Flutter.*
