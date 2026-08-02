import 'package:flutter/material.dart';
import '../../widgets/feature_placeholder_screen.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) => const FeaturePlaceholderScreen(
        title: 'Appointments',
        icon: Icons.event_available_rounded,
        description: 'Doctor appointments, calendar views, details, and statuses will be implemented here.',
      );
}
