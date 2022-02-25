import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/widgets/widgets.dart';

void main() {
  group('ErrorView', () {
    const defaultMessage = 'Something went wrong!';

    testWidgets('renders all the widgets correctly', (tester) async {
      final key = UniqueKey();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ErrorView(
              key: key,
            ),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.widgetWithIcon(Padding, Icons.error), findsOneWidget);
      expect(find.text('Something went wrong!'), findsOneWidget);
    });

    testWidgets('renders correct ErrorView with Key', (tester) async {
      const key = Key('testError');
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ErrorView(key: key),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets(
      'renders default message if message parameter is not passed',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ErrorView(),
            ),
          ),
        );

        expect(find.text(defaultMessage), findsOneWidget);
      },
    );

    testWidgets(
      'renders correct message if message parameter is passed',
      (tester) async {
        const message = 'Error message';
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ErrorView(message: message),
            ),
          ),
        );

        expect(find.text(message), findsOneWidget);
        expect(find.text(defaultMessage), findsNothing);
      },
    );
  });
}
