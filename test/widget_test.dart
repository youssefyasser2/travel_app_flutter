import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:travel_app/app.dart';

void main() {
  testWidgets('shows onboarding screen', (WidgetTester tester) async {
    await tester.pumpWidget(const TravelApp());

    expect(
      find.text('We are here to make your\nholiday easier'),
      findsOneWidget,
    );
    expect(find.text('Get Started'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });

  testWidgets('navigates from onboarding to home', (WidgetTester tester) async {
    await tester.pumpWidget(const TravelApp());

    await tester.ensureVisible(find.text('Get Started'));
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    expect(find.text('Hi, Andy'), findsOneWidget);
    expect(find.text('Frequently visited'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('On Budget Tour'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('On Budget Tour'), findsOneWidget);
  });
}
