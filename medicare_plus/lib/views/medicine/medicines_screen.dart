import 'package:flutter/material.dart';
import '../../widgets/feature_placeholder_screen.dart';

class MedicinesScreen extends StatelessWidget {
  const MedicinesScreen({super.key});

  @override
  Widget build(BuildContext context) => const FeaturePlaceholderScreen(
        title: 'Medicines',
        icon: Icons.medication_rounded,
        description: 'Medicine reminders, dosage schedules, missed doses, and history will be implemented here.',
      );
}
