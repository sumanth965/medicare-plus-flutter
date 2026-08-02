import 'package:flutter/material.dart';

/// Reusable card for displaying a health metric on the dashboard.
/// It accepts data from the parent widget, so the same widget can be reused
/// for BMI, water intake, medicine reminders, appointments, and more.
class HealthSummaryCard extends StatelessWidget {
  const HealthSummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.subtitle,
    super.key,
  });

  final String title;
  final String value;
  final String? subtitle;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color.withValues(alpha: 0.14),
              foregroundColor: color,
              child: Icon(icon),
            ),
            const Spacer(),
            Text(title, style: textTheme.labelLarge),
            const SizedBox(height: 6),
            Text(
              value,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(subtitle!, style: textTheme.bodySmall),
            ],
          ],
        ),
      ),
    );
  }
}
