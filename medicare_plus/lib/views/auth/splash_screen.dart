import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Splash screen shown when the app starts.
/// Later this will check Firebase Authentication and route users to onboarding,
/// login, email verification, or the dashboard.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.health_and_safety_rounded,
                size: 88,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 18),
              Text(
                AppConstants.appName,
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 8),
              Text(
                AppConstants.appTagline,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.dashboard),
                child: const Text('Start Phase 1 preview'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
