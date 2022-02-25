import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/widgets/widgets.dart';
import 'package:flutter_testing/users/users.dart';

void main() {
  group('UsersEmpty', () {
    testWidgets('renders EmptyView', (tester) async {
      final key = UniqueKey();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UsersEmpty(key: key),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(EmptyView), findsOneWidget);
    });
  });
}
