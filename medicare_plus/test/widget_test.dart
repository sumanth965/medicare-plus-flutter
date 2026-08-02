import 'package:flutter_test/flutter_test.dart';
import 'package:medicare_plus/main.dart';

void main() {
  testWidgets('MediCare+ onboarding renders', (tester) async {
    await tester.pumpWidget(const MediCarePlusApp());
    expect(find.text('MediCare+'), findsOneWidget);
    expect(find.text('Get started'), findsOneWidget);
  });
}
