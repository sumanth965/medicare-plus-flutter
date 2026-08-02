import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/main/main_shell.dart';
import '../views/dashboard/dashboard_screen.dart';
import '../views/medicine/medicines_screen.dart';
import '../views/appointments/appointments_screen.dart';
import '../views/reports/reports_screen.dart';
import '../views/settings/settings_screen.dart';
import '../views/health/health_tracker_screen.dart';
import '../views/emergency/emergency_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorHome = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final GlobalKey<NavigatorState> _shellNavigatorMedicines = GlobalKey<NavigatorState>(debugLabel: 'shellMedicines');
final GlobalKey<NavigatorState> _shellNavigatorAppointments = GlobalKey<NavigatorState>(debugLabel: 'shellAppointments');
final GlobalKey<NavigatorState> _shellNavigatorReports = GlobalKey<NavigatorState>(debugLabel: 'shellReports');
final GlobalKey<NavigatorState> _shellNavigatorProfile = GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHome,
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const DashboardScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMedicines,
          routes: [
            GoRoute(
              path: '/medicines',
              builder: (context, state) => const MedicinesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAppointments,
          routes: [
            GoRoute(
              path: '/appointments',
              builder: (context, state) => const AppointmentsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorReports,
          routes: [
            GoRoute(
              path: '/reports',
              builder: (context, state) => const ReportsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfile,
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/health',
      builder: (context, state) => const HealthTrackerScreen(),
    ),
    GoRoute(
      path: '/emergency',
      builder: (context, state) => const EmergencyScreen(),
    ),
  ],
);
