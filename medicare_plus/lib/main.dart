import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/app_constants.dart';
import 'core/themes/app_theme.dart';
import 'routes/app_routes.dart';
import 'views/auth/splash_screen.dart';
import 'views/main/main_shell.dart';

void main() {
  runApp(const ProviderScope(child: MediCarePlusApp()));
}

/// Root widget for MediCare+ with Material 3 theming and Riverpod scope.
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
        AppRoutes.dashboard: (_) => const MainShell(),
      },
    );
  }
}
