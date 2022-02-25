import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/widgets/widgets.dart';
import 'package:flutter_testing/user_detail/user_detail.dart';

void main() {
  group('UserDetailEmpty', () {
    testWidgets('renders EmptyView', (tester) async {
      final key = UniqueKey();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserDetailEmpty(key: key),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(EmptyView), findsOneWidget);
    });
  });
}
