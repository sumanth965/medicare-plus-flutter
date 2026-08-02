import 'package:flutter/material.dart';
import '../../widgets/feature_placeholder_screen.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) => const FeaturePlaceholderScreen(
        title: 'Reports',
        icon: Icons.description_rounded,
        description: 'Medical PDFs, images, categories, search, preview, download, and delete will be implemented here.',
      );
}
