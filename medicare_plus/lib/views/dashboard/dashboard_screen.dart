import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../widgets/health_summary_card.dart';

/// First production-style screen for MediCare+.
/// This screen introduces core Flutter widgets: Scaffold, AppBar, ListView,
/// Card, Container, Row, Column, Stack-like layering via BoxDecoration,
/// Icon, CircleAvatar, ElevatedButton, and reusable custom widgets.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications are coming soon.')),
              );
            },
            icon: const Icon(Icons.notifications_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
                  ],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good morning, Alex',
                          style: textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Your health plan is on track today.',
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add_rounded),
                          label: const Text('Add health record'),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person_rounded, color: Colors.white, size: 38),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Today', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: MediaQuery.sizeOf(context).width > 700 ? 4 : 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.05,
              children: const [
                HealthSummaryCard(
                  title: 'Medicines',
                  value: '3 due',
                  subtitle: 'Next: 2:00 PM',
                  icon: Icons.medication_rounded,
                  color: AppColors.primary,
                ),
                HealthSummaryCard(
                  title: 'Water',
                  value: '5 / 8',
                  subtitle: 'glasses today',
                  icon: Icons.water_drop_rounded,
                  color: AppColors.secondary,
                ),
                HealthSummaryCard(
                  title: 'BMI',
                  value: '22.4',
                  subtitle: 'Normal range',
                  icon: Icons.monitor_weight_rounded,
                  color: AppColors.success,
                ),
                HealthSummaryCard(
                  title: 'Emergency',
                  value: 'SOS',
                  subtitle: 'One-tap call',
                  icon: Icons.emergency_rounded,
                  color: AppColors.danger,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0x1A3B82F6),
                  child: Icon(Icons.calendar_month_rounded, color: AppColors.secondary),
                ),
                title: const Text('Upcoming appointment'),
                subtitle: const Text('Dr. Sarah Wilson • Cardiology • Tomorrow, 10:30 AM'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0x1A10B981),
                  child: Icon(Icons.description_rounded, color: AppColors.success),
                ),
                title: const Text('Medical reports'),
                subtitle: const Text('Upload prescriptions, X-rays, ECGs, and PDFs.'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.medication_rounded), label: 'Meds'),
          NavigationDestination(icon: Icon(Icons.favorite_rounded), label: 'Health'),
          NavigationDestination(icon: Icon(Icons.settings_rounded), label: 'Settings'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add_rounded),
        label: const Text('Quick add'),
      ),
    );
  }
}
