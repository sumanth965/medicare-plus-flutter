import 'package:flutter/material.dart';
import '../../core/themes/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primary,
                  child: Text('AM', style: TextStyle(fontSize: 32, color: Colors.white)),
                ),
                const SizedBox(height: 16),
                Text('Alex Morgan', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 4),
                Text('alex.morgan@example.com', style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildSectionHeader(context, 'Account'),
          _buildListTile(context, Icons.person_outline, 'Personal Information'),
          _buildListTile(context, Icons.health_and_safety_outlined, 'Health Profile'),
          const Divider(),
          _buildSectionHeader(context, 'Preferences'),
          _buildListTile(context, Icons.dark_mode_outlined, 'Appearance', trailing: Switch(value: false, onChanged: (v) {})),
          _buildListTile(context, Icons.notifications_outlined, 'Notifications'),
          _buildListTile(context, Icons.language_outlined, 'Language', trailing: const Text('English')),
          const Divider(),
          _buildSectionHeader(context, 'Security'),
          _buildListTile(context, Icons.lock_outline, 'Privacy & Security'),
          _buildListTile(context, Icons.info_outline, 'About'),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.error),
            title: Text('Logout', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.error)),
            onTap: () {},
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title, {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: trailing == null ? () {} : null,
    );
  }
}
