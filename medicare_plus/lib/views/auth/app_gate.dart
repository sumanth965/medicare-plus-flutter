import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/app_session_provider.dart';
import '../main/main_shell.dart';
import 'auth_screen.dart';
import 'onboarding_screen.dart';

/// Chooses the correct entry experience from the current session state.
class AppGate extends ConsumerWidget {
  const AppGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(appSessionProvider);
    if (!session.hasCompletedOnboarding) return const OnboardingScreen();
    if (!session.isSignedIn) return const AuthScreen();
    return const MainShell();
  }
}
