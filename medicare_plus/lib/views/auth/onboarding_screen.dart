import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../providers/app_session_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  static const _pages = [
    (Icons.health_and_safety_rounded, 'Care that fits your life', 'Keep medicines, appointments, and health records together in one calm, secure place.'),
    (Icons.notifications_active_rounded, 'Never miss the important things', 'Build a simple care routine with timely medicine reminders and appointment preparation.'),
    (Icons.favorite_rounded, 'See your health, clearly', 'Understand everyday progress and bring the right information to every consultation.'),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLast = _page == _pages.length - 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screen,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => ref.read(appSessionProvider.notifier).finishOnboarding(),
                  child: const Text('Skip'),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (value) => setState(() => _page = value),
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: .12),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(page.$1, size: 72, color: AppColors.primary),
                          ),
                          const SizedBox(height: AppSpacing.xxl),
                          Text(page.$2, textAlign: TextAlign.center, style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900)),
                          const SizedBox(height: AppSpacing.md),
                          Text(page.$3, textAlign: TextAlign.center, style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary, height: 1.5)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pages.length, (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  margin: const EdgeInsets.all(4), height: 8,
                  width: index == _page ? 28 : 8,
                  decoration: BoxDecoration(color: index == _page ? AppColors.primary : AppColors.primary.withValues(alpha: .2), borderRadius: BorderRadius.circular(99)),
                )),
              ),
              const SizedBox(height: AppSpacing.lg),
              FilledButton(
                onPressed: () {
                  if (isLast) {
                    ref.read(appSessionProvider.notifier).finishOnboarding();
                  } else {
                    _controller.nextPage(duration: const Duration(milliseconds: 260), curve: Curves.easeOutCubic);
                  }
                },
                child: Text(isLast ? 'Get started' : 'Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
