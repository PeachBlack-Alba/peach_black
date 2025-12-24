import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:peach_black/main.dart';

/// Widget tests for the Portfolio App
/// 
/// Tests the main app initialization and basic rendering.
void main() {
  testWidgets('App initializes and renders main page', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const PortfolioApp());

    // Verify the app builds without errors
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // The start screen should be visible initially
    await tester.pumpAndSettle();
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}