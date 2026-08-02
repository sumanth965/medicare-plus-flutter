import 'package:flutter/material.dart';
import '../../widgets/feature_placeholder_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => const FeaturePlaceholderScreen(
        title: 'Profile',
        icon: Icons.person_rounded,
        description: 'Personal details, blood group, emergency contacts, allergies, and edit profile will be implemented here.',
      );
}
