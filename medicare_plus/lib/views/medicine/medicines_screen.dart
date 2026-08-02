import 'package:flutter/material.dart';
import '../../widgets/custom_card.dart';
import '../../core/themes/app_colors.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MedicinesScreen extends StatelessWidget {
  const MedicinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicines'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMedicineCard(
            context: context,
            name: 'Metformin',
            dosage: '500mg',
            time: '8:00 AM',
            status: 'Taken',
            badge: 'After Food',
          ).animate().fadeIn().slideX(begin: 0.1, end: 0),
          _buildMedicineCard(
            context: context,
            name: 'Vitamin D3',
            dosage: '1000 IU',
            time: '2:00 PM',
            status: 'Upcoming',
            badge: 'After Food',
          ).animate().fadeIn(delay: 100.ms).slideX(begin: 0.1, end: 0),
          _buildMedicineCard(
            context: context,
            name: 'Aspirin',
            dosage: '75mg',
            time: '9:00 PM',
            status: 'Upcoming',
            badge: 'Before Food',
          ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.1, end: 0),
        ],
      ),
    );
  }

  Widget _buildMedicineCard({
    required BuildContext context,
    required String name,
    required String dosage,
    required String time,
    required String status,
    required String badge,
  }) {
    final theme = Theme.of(context);
    final isTaken = status == 'Taken';

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Dismissible(
        key: Key(name),
        background: Container(
          decoration: BoxDecoration(
            color: AppColors.error,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        direction: DismissDirection.endToStart,
        child: CustomCard(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.medication, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text('$dosage · $time', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.secondary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            badge,
                            style: theme.textTheme.labelSmall?.copyWith(color: AppColors.secondary),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: isTaken ? AppColors.success.withOpacity(0.1) : AppColors.warning.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            status,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: isTaken ? AppColors.success : AppColors.warning,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (!isTaken)
                IconButton(
                  icon: const Icon(Icons.check_circle_outline),
                  color: AppColors.success,
                  onPressed: () {},
                )
              else
                const Icon(Icons.check_circle, color: AppColors.success),
            ],
          ),
        ),
      ),
    );
  }
}
