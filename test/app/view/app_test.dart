import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders Login', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(),
        ),
      );
    });
  });
}
