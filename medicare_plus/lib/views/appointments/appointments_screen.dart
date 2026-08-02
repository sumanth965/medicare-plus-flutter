import 'package:flutter/material.dart';
import '../../widgets/custom_card.dart';
import '../../core/themes/app_colors.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Upcoming', style: theme.textTheme.titleLarge),
          const SizedBox(height: 12),
          _buildAppointmentCard(
            context: context,
            doctorName: 'Dr. Sarah Wilson',
            specialty: 'Cardiology',
            date: 'Tomorrow, 10:30 AM',
            hospital: 'City Hospital',
            status: 'Confirmed',
            statusColor: AppColors.success,
          ).animate().fadeIn().slideY(begin: 0.1, end: 0),
          const SizedBox(height: 24),
          Text('Past Appointments', style: theme.textTheme.titleLarge),
          const SizedBox(height: 12),
          _buildAppointmentCard(
            context: context,
            doctorName: 'Dr. James Lee',
            specialty: 'Dermatology',
            date: '15 Jul 2026, 02:00 PM',
            hospital: 'Skin Clinic',
            status: 'Completed',
            statusColor: AppColors.primary,
          ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1, end: 0),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildAppointmentCard({
    required BuildContext context,
    required String doctorName,
    required String specialty,
    required String date,
    required String hospital,
    required String status,
    required Color statusColor,
  }) {
    final theme = Theme.of(context);
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.background,
                child: Icon(Icons.person, size: 40, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctorName, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(specialty, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(status, style: theme.textTheme.labelSmall?.copyWith(color: statusColor)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Text(date, style: theme.textTheme.bodySmall),
              const SizedBox(width: 16),
              const Icon(Icons.location_on, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Expanded(child: Text(hospital, style: theme.textTheme.bodySmall)),
            ],
          ),
        ],
      ),
    );
  }
}
