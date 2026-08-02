import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/navigation_provider.dart';
import '../appointments/appointments_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../medicine/medicines_screen.dart';
import '../profile/profile_screen.dart';
import '../reports/reports_screen.dart';

/// Root authenticated shell with the five product tabs requested for MediCare+.
class MainShell extends ConsumerWidget {
  const MainShell({super.key});

  static const _screens = [
    DashboardScreen(),
    MedicinesScreen(),
    AppointmentsScreen(),
    ReportsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedTabProvider);

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 260),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        child: KeyedSubtree(
          key: ValueKey(selectedIndex),
          child: _screens[selectedIndex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) =>
            ref.read(selectedTabProvider.notifier).state = index,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.medication_rounded), label: 'Medicines'),
          NavigationDestination(icon: Icon(Icons.event_available_rounded), label: 'Appointments'),
          NavigationDestination(icon: Icon(Icons.description_rounded), label: 'Reports'),
          NavigationDestination(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}
