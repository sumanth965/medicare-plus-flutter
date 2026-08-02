import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Holds the selected root tab so navigation state is separated from UI code.
final selectedTabProvider = StateProvider<int>((ref) => 0);
