import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../providers/app_session_provider.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _register = false;
  bool _obscure = true;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref.read(appSessionProvider.notifier).signIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: ListView(
              padding: AppSpacing.screen,
              children: [
                const SizedBox(height: AppSpacing.xxl),
                const Icon(Icons.health_and_safety_rounded, size: 58, color: AppColors.primary),
                const SizedBox(height: AppSpacing.lg),
                Text(_register ? 'Create your account' : 'Welcome back', textAlign: TextAlign.center, style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900)),
                const SizedBox(height: AppSpacing.sm),
                Text(_register ? 'Start building a clearer picture of your health.' : 'Sign in to continue your care plan.', textAlign: TextAlign.center, style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary)),
                const SizedBox(height: AppSpacing.xxl),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    if (_register) ...[
                      TextFormField(decoration: const InputDecoration(labelText: 'Full name', prefixIcon: Icon(Icons.person_outline_rounded)), validator: (value) => (value == null || value.trim().length < 2) ? 'Enter your name' : null),
                      const SizedBox(height: AppSpacing.md),
                    ],
                    TextFormField(keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(labelText: 'Email address', prefixIcon: Icon(Icons.email_outlined)), validator: (value) => (value == null || !value.contains('@')) ? 'Enter a valid email' : null),
                    const SizedBox(height: AppSpacing.md),
                    TextFormField(obscureText: _obscure, decoration: InputDecoration(labelText: 'Password', prefixIcon: const Icon(Icons.lock_outline_rounded), suffixIcon: IconButton(onPressed: () => setState(() => _obscure = !_obscure), icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined))), validator: (value) => (value == null || value.length < 6) ? 'Use at least 6 characters' : null),
                  ]),
                ),
                if (!_register) Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () => _showResetDialog(context), child: const Text('Forgot password?'))),
                const SizedBox(height: AppSpacing.md),
                FilledButton(onPressed: _submit, child: Text(_register ? 'Create account' : 'Sign in')),
                const SizedBox(height: AppSpacing.md),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(_register ? 'Already have an account?' : 'New to MediCare+?'),
                  TextButton(onPressed: () => setState(() => _register = !_register), child: Text(_register ? 'Sign in' : 'Create account')),
                ]),
                const SizedBox(height: AppSpacing.lg),
                Text('Demo mode: enter any valid email and 6-character password. Connect Firebase Auth before production.', textAlign: TextAlign.center, style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showResetDialog(BuildContext context) {
    showDialog<void>(context: context, builder: (context) => AlertDialog(
      title: const Text('Reset password'),
      content: const Text('When Firebase Auth is connected, we will email you a secure reset link.'),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
    ));
  }
}
