import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plasma_background/main.dart';

void main() {
  testWidgets('Plasma background test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Plasma Background Demo'), findsOneWidget);
    expect(find.text('Move your mouse around to interact with the plasma effect'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}