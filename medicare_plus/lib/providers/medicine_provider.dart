import 'package:flutter_riverpod/flutter_riverpod.dart';

class Medicine {
  const Medicine({
    required this.name,
    required this.dose,
    required this.time,
    this.taken = false,
  });
  final String name;
  final String dose;
  final String time;
  final bool taken;
  Medicine copyWith({bool? taken}) =>
      Medicine(name: name, dose: dose, time: time, taken: taken ?? this.taken);
}

final medicinesProvider = NotifierProvider<MedicinesNotifier, List<Medicine>>(
  MedicinesNotifier.new,
);

class MedicinesNotifier extends Notifier<List<Medicine>> {
  @override
  List<Medicine> build() => const [
    Medicine(
      name: 'Metformin',
      dose: '500 mg · After breakfast',
      time: '8:00 AM',
    ),
    Medicine(
      name: 'Vitamin D3',
      dose: '1 capsule · After lunch',
      time: '2:00 PM',
    ),
    Medicine(
      name: 'Atorvastatin',
      dose: '10 mg · Before sleep',
      time: '9:00 PM',
    ),
  ];
  void toggle(int index) => state = [
    for (var i = 0; i < state.length; i++)
      i == index ? state[i].copyWith(taken: !state[i].taken) : state[i],
  ];
  void add(String name, String dose, String time) =>
      state = [...state, Medicine(name: name, dose: dose, time: time)];
}
