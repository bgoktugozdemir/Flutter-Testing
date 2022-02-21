import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/users/users.dart';

void main() {
  group('UsersError', () {
    testWidgets('renders correct icon and text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UsersError(),
          ),
        ),
      );
      expect(find.byIcon(Icons.error), findsOneWidget);
      expect(find.text('Something went wrong!'), findsOneWidget);
    });
  });
}
