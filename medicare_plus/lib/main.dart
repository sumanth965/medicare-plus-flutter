import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/constants/app_constants.dart';
import 'core/services/firebase_service.dart';
import 'core/themes/app_theme.dart';
import 'providers/app_state.dart';
import 'views/auth/app_gate.dart';

Future<void> main() async { WidgetsFlutterBinding.ensureInitialized(); await FirebaseService.initialize(); runApp(const ProviderScope(child: MediCarePlusApp())); }
class MediCarePlusApp extends ConsumerWidget { const MediCarePlusApp({super.key}); @override Widget build(BuildContext context, WidgetRef ref){ final dark=ref.watch(settingsProvider).darkMode; return MaterialApp(title:AppConstants.appName,debugShowCheckedModeBanner:false,theme:AppTheme.light,darkTheme:AppTheme.dark,themeMode:dark?ThemeMode.dark:ThemeMode.light,home:const AppGate());}}
