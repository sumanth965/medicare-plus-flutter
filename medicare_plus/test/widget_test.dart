import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medicare_plus/main.dart';

void main() {
  testWidgets('MediCare+ splash opens dashboard preview', (WidgetTester tester) async {
    await tester.pumpWidget(const MediCarePlusApp());

    expect(find.text('MediCare+'), findsOneWidget);
    expect(find.text('Smart Personal Healthcare Companion'), findsOneWidget);

    await tester.tap(find.byType(FilledButton));
    await tester.pumpAndSettle();

    expect(find.text('Good morning, Alex'), findsOneWidget);
    expect(find.text('Medicines'), findsOneWidget);
  });
}
