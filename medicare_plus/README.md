# MediCare+

**Your Personal Smart Healthcare Companion**

MediCare+ is being built as a production-quality Flutter healthcare application with Material Design 3, a reusable design system, responsive layouts, Riverpod state management, and a scalable MVVM-ready folder structure.

## Current Phase

This commit implements the first feature slice:

- Healthcare design-system tokens for colors, spacing, radii, and shadows.
- Material 3 light/dark themes with Google Fonts Inter typography.
- Riverpod app scope and root tab state.
- A five-tab authenticated shell: Home, Medicines, Appointments, Reports, and Profile.
- A polished responsive Home dashboard with health score, progress cards, quick actions, appointment preview, and daily health tip.
- Professional placeholders for upcoming feature modules.

## Architecture

```text
lib/
  core/
    constants/      Design tokens and app constants
    themes/         Global Material 3 themes
    services/       Firebase, notifications, device APIs
    utils/          Formatters, validators, extensions
  models/           Domain and DTO models
  providers/        Riverpod providers
  repositories/     Data access abstractions
  viewmodels/       Screen/business state controllers
  views/            Feature screens
  widgets/          Reusable UI components
```

## Firebase Setup Roadmap

Firebase will be integrated feature-by-feature after the UI foundation is stable:

1. Create a Firebase project for Android and iOS.
2. Install FlutterFire CLI.
3. Run `flutterfire configure`.
4. Add Firebase Authentication for login, registration, verification, password reset, and logout.
5. Add Firestore collections for users, medicines, appointments, reports, vitals, and health tips.
6. Add Firebase Storage for profile images and medical reports.
7. Add Firebase Cloud Messaging for reminders and care notifications.
8. Add security rules before production deployment.

## Installation

```bash
flutter pub get
flutter run
```

## Key Dependencies

- `flutter_riverpod` for scalable state management.
- `google_fonts` for premium typography.
- `cupertino_icons` for platform icon compatibility.

## Screenshots

Add screenshots here as each production feature is completed:

- `docs/screenshots/home-dashboard.png`
- `docs/screenshots/medicines.png`
- `docs/screenshots/appointments.png`
- `docs/screenshots/reports.png`
- `docs/screenshots/profile.png`

## Future Enhancements

- Firebase authentication flow.
- Medicine reminders and local notifications.
- Appointment calendar and detail screens.
- Medical report upload, preview, search, and delete.
- Health tracker charts and analytics.
- Water reminder, BMI calculator, emergency SOS, and health tips.
- AI symptom checker with safe, non-diagnostic guidance.
- OCR prescription reader, barcode scanner, nearby hospitals, doctor chat, voice assistant, and wearable integration.

## Deployment Guide

Before publishing:

1. Run `flutter analyze` and all tests.
2. Configure app icons and splash assets.
3. Configure Firebase production projects and rules.
4. Verify Android package name, signing config, app version, and permissions.
5. Test on small phones, large phones, tablets, and landscape orientation.
6. Build with `flutter build appbundle` for Google Play.
