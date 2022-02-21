import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/users/users.dart';

void main() {
  group('UsersEmpty', () {
    testWidgets('renders correct icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UsersEmpty(),
          ),
        ),
      );
      expect(find.byIcon(Icons.people), findsOneWidget);
    });
  });
}
