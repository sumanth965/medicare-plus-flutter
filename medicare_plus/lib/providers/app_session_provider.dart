import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Local session state. Replace this notifier's methods with an AuthRepository
/// backed by Firebase Auth once Firebase configuration is available.
final appSessionProvider =
    NotifierProvider<AppSessionNotifier, AppSession>(AppSessionNotifier.new);

class AppSession {
  const AppSession({this.hasCompletedOnboarding = false, this.isSignedIn = false});

  final bool hasCompletedOnboarding;
  final bool isSignedIn;

  AppSession copyWith({bool? hasCompletedOnboarding, bool? isSignedIn}) =>
      AppSession(
        hasCompletedOnboarding:
            hasCompletedOnboarding ?? this.hasCompletedOnboarding,
        isSignedIn: isSignedIn ?? this.isSignedIn,
      );
}

class AppSessionNotifier extends Notifier<AppSession> {
  @override
  AppSession build() => const AppSession();

  void finishOnboarding() => state = state.copyWith(hasCompletedOnboarding: true);
  void signIn() => state = state.copyWith(isSignedIn: true);
  void signOut() => state = state.copyWith(isSignedIn: false);
}
