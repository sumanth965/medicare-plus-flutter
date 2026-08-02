import 'package:flutter/material.dart';
import '../../widgets/custom_card.dart';
import '../../core/themes/app_colors.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Reports'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search reports...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildReportCard(
            context: context,
            title: 'Complete Blood Count',
            date: '12 Aug 2026',
            size: '2.4 MB',
            type: 'PDF',
          ).animate().fadeIn().slideX(begin: 0.1, end: 0),
          const SizedBox(height: 12),
          _buildReportCard(
            context: context,
            title: 'Chest X-Ray',
            date: '05 Jul 2026',
            size: '5.1 MB',
            type: 'IMAGE',
          ).animate().fadeIn(delay: 100.ms).slideX(begin: 0.1, end: 0),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.upload),
      ),
    );
  }

  Widget _buildReportCard({
    required BuildContext context,
    required String title,
    required String date,
    required String size,
    required String type,
  }) {
    final theme = Theme.of(context);
    return CustomCard(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            type == 'PDF' ? Icons.picture_as_pdf : Icons.image,
            color: AppColors.primary,
          ),
        ),
        title: Text(title, style: theme.textTheme.titleMedium),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            children: [
              Text(date, style: theme.textTheme.bodySmall),
              const SizedBox(width: 8),
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: AppColors.textSecondary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(size, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ),
    );
  }
}
