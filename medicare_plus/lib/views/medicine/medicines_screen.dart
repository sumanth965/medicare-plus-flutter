import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../providers/medicine_provider.dart';

class MedicinesScreen extends ConsumerWidget {
  const MedicinesScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicines = ref.watch(medicinesProvider);
    final done = medicines.where((m) => m.taken).length;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _add(context, ref),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add medicine'),
      ),
      body: SafeArea(
        child: ListView(
          padding: AppSpacing.screen,
          children: [
            Text(
              'Medicines',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '$done of ${medicines.length} doses completed today',
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.lg),
            ...medicines.indexed.map((item) {
              final i = item.$1;
              final m = item.$2;
              return Card(
                child: CheckboxListTile(
                  value: m.taken,
                  onChanged: (_) =>
                      ref.read(medicinesProvider.notifier).toggle(i),
                  controlAffinity: ListTileControlAffinity.trailing,
                  secondary: CircleAvatar(
                    backgroundColor: AppColors.primary.withValues(alpha: .12),
                    child: const Icon(
                      Icons.medication_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  title: Text(
                    m.name,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text('${m.dose}\n${m.time}'),
                  isThreeLine: true,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  void _add(BuildContext context, WidgetRef ref) {
    final name = TextEditingController();
    final dose = TextEditingController();
    final time = TextEditingController(text: '8:00 AM');
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.fromLTRB(
          24,
          24,
          24,
          24 + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add medicine', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            TextField(
              controller: name,
              decoration: const InputDecoration(labelText: 'Medicine name'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: dose,
              decoration: const InputDecoration(
                labelText: 'Dosage and instructions',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: time,
              decoration: const InputDecoration(labelText: 'Time'),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                if (name.text.trim().isEmpty) return;
                ref
                    .read(medicinesProvider.notifier)
                    .add(
                      name.text.trim(),
                      dose.text.trim().isEmpty
                          ? 'As prescribed'
                          : dose.text.trim(),
                      time.text.trim(),
                    );
                Navigator.pop(context);
              },
              child: const Text('Save medicine'),
            ),
          ],
        ),
      ),
    );
  }
}
