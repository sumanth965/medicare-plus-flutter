import 'package:flutter/material.dart';
import '../../core/themes/app_colors.dart';
import '../../widgets/custom_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HealthTrackerScreen extends StatelessWidget {
  const HealthTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Health Tracker')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildChartCard(
            context: context,
            title: 'Heart Rate',
            value: '72 bpm',
            subtitle: 'Average this week',
            color: AppColors.error,
          ).animate().fadeIn().slideY(begin: 0.1, end: 0),
          const SizedBox(height: 16),
          _buildChartCard(
            context: context,
            title: 'Blood Pressure',
            value: '120/80',
            subtitle: 'Last reading: Today, 8 AM',
            color: AppColors.primary,
          ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1, end: 0),
        ],
      ),
    );
  }

  Widget _buildChartCard({
    required BuildContext context,
    required String title,
    required String value,
    required String subtitle,
    required Color color,
  }) {
    final theme = Theme.of(context);
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: theme.textTheme.headlineMedium?.copyWith(color: color, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              Text(subtitle, style: theme.textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 3),
                      FlSpot(1, 4),
                      FlSpot(2, 3.5),
                      FlSpot(3, 5),
                      FlSpot(4, 4),
                      FlSpot(5, 4.5),
                      FlSpot(6, 4),
                    ],
                    isCurved: true,
                    color: color,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: color.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
