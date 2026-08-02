import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_card.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/themes/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(theme, isDark),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  _buildHealthScoreCard(theme),
                  const SizedBox(height: 24),
                  
                  Text('Quick Actions', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 12),
                  _buildQuickActionsGrid(context),
                  const SizedBox(height: 24),
                  
                  Text('Today\'s Schedule', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 12),
                  _buildScheduleCard(
                    theme: theme,
                    icon: Icons.medication,
                    iconColor: AppColors.primary,
                    title: 'Metformin · 500mg',
                    subtitle: '8:00 AM · After Food',
                    trailingIcon: Icons.check_circle,
                    trailingColor: AppColors.success,
                    delay: 300,
                  ),
                  _buildScheduleCard(
                    theme: theme,
                    icon: Icons.person,
                    iconColor: AppColors.secondary,
                    title: 'Dr. Sarah Wilson',
                    subtitle: '10:30 AM · Cardiology',
                    trailingIcon: Icons.chevron_right,
                    trailingColor: AppColors.textSecondary,
                    onTap: () => context.go('/appointments'),
                    delay: 400,
                  ),
                  const SizedBox(height: 24),
                  
                  _buildDailyTipCard(theme),
                  const SizedBox(height: 100), // Space for FAB
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/emergency'),
        backgroundColor: AppColors.error,
        foregroundColor: Colors.white,
        elevation: 4,
        icon: const Icon(Icons.emergency),
        label: const Text('SOS', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
      ).animate().scale(delay: 600.ms, duration: 400.ms, curve: Curves.easeOutBack),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildSliverAppBar(ThemeData theme, bool isDark) {
    return SliverAppBar(
      expandedHeight: 140.0,
      floating: false,
      pinned: true,
      elevation: 0,
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.primary,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning,',
              style: theme.textTheme.titleSmall?.copyWith(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'Alex Morgan',
              style: theme.textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ).animate().fadeIn().slideX(begin: -0.1, end: 0),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    isDark ? AppColors.darkBackground : AppColors.primary,
                    isDark ? AppColors.darkSurface : AppColors.primary.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
            Positioned(
              right: -50,
              top: -50,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        Container(
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: const CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildHealthScoreCard(ThemeData theme) {
    return CustomCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.monitor_heart, color: AppColors.success, size: 20),
                    const SizedBox(width: 8),
                    Text('Health Score', style: theme.textTheme.titleMedium),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Your care plan is on track! Keep up the good work today.',
                  style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('View Details', style: theme.textTheme.labelLarge?.copyWith(color: AppColors.primary)),
                      const SizedBox(width: 4),
                      const Icon(Icons.arrow_forward, size: 16, color: AppColors.primary),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: 0.86,
                  strokeWidth: 8,
                  backgroundColor: AppColors.success.withValues(alpha: 0.2),
                  color: AppColors.success,
                  strokeCap: StrokeCap.round,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('86', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, height: 1.0)),
                  Text('%', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textSecondary)),
                ],
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildQuickActionsGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 8,
      children: [
        _buildActionItem(context, Icons.medication, 'Medicines', AppColors.primary, () => context.go('/medicines')),
        _buildActionItem(context, Icons.event, 'Appointments', AppColors.secondary, () => context.go('/appointments')),
        _buildActionItem(context, Icons.monitor_heart, 'Health', AppColors.warning, () => context.push('/health')),
        _buildActionItem(context, Icons.description, 'Reports', Colors.purple, () => context.go('/reports')),
      ],
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildActionItem(BuildContext context, IconData icon, String label, Color color, VoidCallback onTap) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      splashColor: color.withValues(alpha: 0.1),
      highlightColor: color.withValues(alpha: 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: theme.textTheme.labelSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  Widget _buildScheduleCard({
    required ThemeData theme,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required IconData trailingIcon,
    required Color trailingColor,
    VoidCallback? onTap,
    required int delay,
  }) {
    return CustomCard(
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(title, style: theme.textTheme.titleMedium),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(subtitle, style: theme.textTheme.bodySmall),
        ),
        trailing: Icon(trailingIcon, color: trailingColor),
      ),
    ).animate().fadeIn(delay: delay.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildDailyTipCard(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.warning.withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb, color: AppColors.warning, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Daily Health Tip', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.warning)),
                const SizedBox(height: 4),
                Text(
                  'Drink at least 8 glasses of water today to stay hydrated and energetic.',
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1, end: 0);
  }
}
