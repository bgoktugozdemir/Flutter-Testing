import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/widgets/widgets.dart';

void main() {
  group('LoadingView', () {
    const defaultMessage = 'Loading...';

    testWidgets(
      "renders all the widgets correctly",
      (WidgetTester tester) async {
        final key = UniqueKey();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: LoadingView(key: key),
            ),
          ),
        );

        expect(find.byKey(key), findsOneWidget);
        expect(find.byType(Column), findsOneWidget);
        expect(find.byType(Padding), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.byType(Text), findsOneWidget);
      },
    );

    testWidgets(
      "renders correct LoadingView with Key",
      (WidgetTester tester) async {
        const key = Key('testLoading');
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: LoadingView(key: key),
            ),
          ),
        );

        expect(find.byKey(key), findsOneWidget);
      },
    );

    testWidgets(
      "renders default message if message parameter is not passed",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: LoadingView(),
            ),
          ),
        );

        expect(find.text(defaultMessage), findsOneWidget);
      },
    );

    testWidgets(
      "renders correct message if message parameter is passed",
      (WidgetTester tester) async {
        const message = 'Something loading...';
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: LoadingView(message: message),
            ),
          ),
        );

        expect(find.text(message), findsOneWidget);
        expect(find.text(defaultMessage), findsNothing);
      },
    );
  });
}
