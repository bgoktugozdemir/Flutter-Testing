import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/widgets/widgets.dart';

void main() {
  group('EmptyView', () {
    testWidgets('renders all the widgets correctly', (tester) async {
      const icon = Icons.flutter_dash;
      final key = UniqueKey();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmptyView(icon, key: key),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byIcon(icon), findsOneWidget);
    });
  });
}
