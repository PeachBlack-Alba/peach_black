import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plasma_background/plasma_background.dart';

void main() {
  group('PlasmaBackground Widget Tests', () {
    testWidgets('PlasmaBackground creates without error', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlasmaBackground(),
          ),
        ),
      );

      expect(find.byType(PlasmaBackground), findsOneWidget);
    });

    testWidgets('PlasmaBackground accepts custom parameters', (WidgetTester tester) async {
      const plasma = PlasmaBackground(
        color: Colors.red,
        speed: 2.0,
        direction: PlasmaDirection.reverse,
        scale: 1.5,
        opacity: 0.5,
        mouseInteractive: false,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: plasma,
          ),
        ),
      );

      expect(plasma.color, Colors.red);
      expect(plasma.speed, 2.0);
      expect(plasma.direction, PlasmaDirection.reverse);
      expect(plasma.scale, 1.5);
      expect(plasma.opacity, 0.5);
      expect(plasma.mouseInteractive, false);
    });

    testWidgets('PlasmaBackground rebuilds when parameters change', (WidgetTester tester) async {
      Color testColor = Colors.blue;
      double testSpeed = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    Expanded(
                      child: PlasmaBackground(
                        color: testColor,
                        speed: testSpeed,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          testColor = Colors.green;
                          testSpeed = 2.0;
                        });
                      },
                      child: const Text('Change'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      // Initial state
      expect(find.byType(PlasmaBackground), findsOneWidget);

      // Trigger rebuild
      await tester.tap(find.text('Change'));
      await tester.pump();

      // Should still find the widget (it rebuilds but doesn't disappear)
      expect(find.byType(PlasmaBackground), findsOneWidget);
    });
  });

  group('PlasmaDirection Tests', () {
    test('PlasmaDirection enum has correct values', () {
      expect(PlasmaDirection.values.length, 3);
      expect(PlasmaDirection.values, contains(PlasmaDirection.forward));
      expect(PlasmaDirection.values, contains(PlasmaDirection.reverse));
      expect(PlasmaDirection.values, contains(PlasmaDirection.pingpong));
    });

    test('PlasmaDirection extension returns correct base values', () {
      expect(PlasmaDirection.forward.baseValue, 1.0);
      expect(PlasmaDirection.reverse.baseValue, -1.0);
      expect(PlasmaDirection.pingpong.baseValue, 1.0);
    });
  });
}