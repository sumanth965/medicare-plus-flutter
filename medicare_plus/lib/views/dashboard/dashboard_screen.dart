import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_radii.dart';
import '../../core/constants/app_shadows.dart';
import '../../core/constants/app_spacing.dart';
import '../../widgets/health_summary_card.dart';
import '../../widgets/section_header.dart';

/// Home dashboard: the first production feature slice for MediCare+.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final cardColumns = width >= 900 ? 4 : width >= 560 ? 3 : 2;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: AppSpacing.screen,
            sliver: SliverList.list(
              children: [
                _DashboardHeader(theme: theme),
                const SizedBox(height: AppSpacing.lg),
                _HealthScoreCard(theme: theme),
                const SizedBox(height: AppSpacing.lg),
                const SectionHeader(title: 'Today\'s progress', actionLabel: 'View all'),
                const SizedBox(height: AppSpacing.md),
                GridView.count(
                  crossAxisCount: cardColumns,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: AppSpacing.md,
                  crossAxisSpacing: AppSpacing.md,
                  childAspectRatio: width < 380 ? 0.92 : 1.08,
                  children: const [
                    HealthSummaryCard(title: 'Medicines', value: '3 due', subtitle: 'Next 2:00 PM', icon: Icons.medication_rounded, color: AppColors.primary),
                    HealthSummaryCard(title: 'Water', value: '5 / 8', subtitle: '62% complete', icon: Icons.water_drop_rounded, color: AppColors.info),
                    HealthSummaryCard(title: 'Appointment', value: '10:30', subtitle: 'Cardiology', icon: Icons.event_available_rounded, color: AppColors.secondary),
                    HealthSummaryCard(title: 'Reports', value: '2 new', subtitle: 'Needs review', icon: Icons.description_rounded, color: AppColors.warning),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                const SectionHeader(title: 'Quick actions'),
                const SizedBox(height: AppSpacing.md),
                Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.md,
                  children: const [
                    _QuickAction(icon: Icons.add_rounded, label: 'Add medicine'),
                    _QuickAction(icon: Icons.monitor_heart_rounded, label: 'Log vitals'),
                    _QuickAction(icon: Icons.upload_file_rounded, label: 'Upload report'),
                    _QuickAction(icon: Icons.emergency_rounded, label: 'Emergency'),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                _AppointmentCard(theme: theme),
                const SizedBox(height: AppSpacing.md),
                _HealthTipCard(theme: theme),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good morning, Alex', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900)),
              const SizedBox(height: AppSpacing.xs),
              Text('Your care plan is on track today.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
            ],
          ),
        ),
        IconButton.filledTonal(onPressed: () {}, icon: const Icon(Icons.notifications_rounded)),
        const SizedBox(width: AppSpacing.sm),
        const CircleAvatar(radius: 24, child: Icon(Icons.person_rounded)),
      ],
    );
  }
}

class _HealthScoreCard extends StatelessWidget {
  const _HealthScoreCard({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: AppShadows.glowBlue,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.secondary],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Health score', style: theme.textTheme.labelLarge?.copyWith(color: Colors.white70, fontWeight: FontWeight.w700)),
                const SizedBox(height: AppSpacing.sm),
                Text('86%', style: theme.textTheme.displaySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w900)),
                const SizedBox(height: AppSpacing.sm),
                Text('Great work. Hydration and medicines are your focus areas today.', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white.withValues(alpha: 0.9))),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          SizedBox(
            width: 82,
            height: 82,
            child: CircularProgressIndicator(
              value: 0.86,
              strokeWidth: 9,
              backgroundColor: Colors.white24,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadii.pill)),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  const _AppointmentCard({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(AppSpacing.md),
        leading: const CircleAvatar(backgroundColor: Color(0x1A10B981), child: Icon(Icons.calendar_month_rounded, color: AppColors.secondary)),
        title: const Text('Upcoming appointment'),
        subtitle: const Text('Dr. Sarah Wilson • Cardiology • Tomorrow, 10:30 AM'),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () {},
      ),
    );
  }
}

class _HealthTipCard extends StatelessWidget {
  const _HealthTipCard({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            const CircleAvatar(backgroundColor: Color(0x1AF59E0B), child: Icon(Icons.tips_and_updates_rounded, color: AppColors.warning)),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text('Tip: Take a 10-minute walk after lunch to support heart health and glucose control.', style: theme.textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }
}
