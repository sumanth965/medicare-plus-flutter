import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Holds the selected root tab so navigation state is separated from UI code.
final selectedTabProvider = NotifierProvider<SelectedTabNotifier, int>(
  SelectedTabNotifier.new,
);

class SelectedTabNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void select(int index) => state = index;
}
