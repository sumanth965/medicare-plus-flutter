import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/app_constants.dart';
import 'core/themes/app_theme.dart';
import 'views/auth/app_gate.dart';

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
      home: const AppGate(),
    );
  }
}
