import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/user_detail/widgets/user_detail_error.dart';

void main() {
  group('UserDetailError', () {
    testWidgets('renders ErrorView', (tester) async {
      final key = UniqueKey();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserDetailError(key: key),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(UserDetailError), findsOneWidget);
    });
  });
}
