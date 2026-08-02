import 'package:flutter/material.dart';
import '../../core/themes/app_colors.dart';
import '../../widgets/custom_card.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.error,
      appBar: AppBar(
        title: const Text('Emergency SOS'),
        backgroundColor: AppColors.error,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Center(
              child: GestureDetector(
                onTap: () {}, // Add call logic
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.error.withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'SOS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ).animate(onPlay: (controller) => controller.repeat(reverse: true)).scaleXY(end: 1.05, duration: 1000.ms),
              ),
            ),
            const SizedBox(height: 32),
            CustomCard(
              child: Column(
                children: [
                  _buildInfoRow(context, 'Blood Group', 'O+'),
                  const Divider(),
                  _buildInfoRow(context, 'Allergies', 'Penicillin, Peanuts'),
                  const Divider(),
                  _buildInfoRow(context, 'Medical Conditions', 'Type 2 Diabetes'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text('Emergency Contacts', style: theme.textTheme.titleLarge),
            const SizedBox(height: 12),
            _buildContactCard(context, 'Mom', '+1 234 567 8900'),
            _buildContactCard(context, 'Dr. Smith', '+1 987 654 3210'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
          Text(value, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }

  Widget _buildContactCard(BuildContext context, String name, String phone) {
    return CustomCard(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const CircleAvatar(
          backgroundColor: AppColors.error,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name),
        subtitle: Text(phone),
        trailing: IconButton(
          icon: const Icon(Icons.phone, color: AppColors.error),
          onPressed: () {},
        ),
      ),
    );
  }
}
