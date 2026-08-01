/// Phase 1 learning guide for MediCare+.
///
/// This file is intentionally documentation-only. It gives beginners a map of
/// the project before deeper Firebase and feature modules are added.
class ProjectGuide {
  const ProjectGuide._();

  /// Folder purposes:
  /// - core/constants: app-wide values such as colors, names, and spacing.
  /// - core/themes: light theme, dark theme, typography, button, and input styles.
  /// - core/utils: small helper functions shared by multiple features.
  /// - core/services: wrappers around external APIs such as Firebase and notifications.
  /// - models: typed Dart objects that represent app data.
  /// - repositories: data access classes that hide Firebase/local storage details.
  /// - providers: Riverpod providers that expose dependencies and state.
  /// - viewmodels: MVVM classes that prepare UI state and handle user actions.
  /// - views: screens grouped by feature, such as auth, dashboard, medicine, and BMI.
  /// - widgets: reusable UI pieces shared across screens.
  /// - routes: navigation names and route setup.
  static const List<String> folderPurposes = [
    'core/constants keeps repeated values in one safe place.',
    'core/themes keeps the app visually consistent.',
    'core/utils will hold shared helper functions.',
    'core/services will isolate Firebase and notification integrations.',
    'models will define strongly typed healthcare data objects.',
    'repositories will perform CRUD without exposing backend details to UI.',
    'providers will contain Riverpod dependency and state providers.',
    'viewmodels will connect views to repositories using MVVM.',
    'views contains feature screens.',
    'widgets contains reusable visual components.',
    'routes contains named navigation paths.',
  ];
}
