import 'package:flutter/material.dart';

import 'core/constants/app_constants.dart';
import 'core/themes/app_theme.dart';
import 'routes/app_routes.dart';
import 'views/auth/splash_screen.dart';
import 'views/dashboard/dashboard_screen.dart';

/// main() is the first Dart function that runs when the app starts.
/// runApp places our root widget into Flutter's rendering tree.
void main() {
  runApp(const MediCarePlusApp());
}

/// Root widget for MediCare+.
/// StatelessWidget is used because this object only describes configuration;
/// it does not store changing UI state itself.
class MediCarePlusApp extends StatelessWidget {
  const MediCarePlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.dashboard: (_) => const DashboardScreen(),
      },
    );
  }
}
