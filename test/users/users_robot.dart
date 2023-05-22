import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/users/widgets/widgets.dart';

class UsersRobot {
  const UsersRobot(WidgetTester tester) : _tester = tester;

  final WidgetTester _tester;

  Future<void> pumpEmptyWidget({Key? key}) async {
    await pumpApp(
      body: UsersEmpty(key: key),
    );
  }

  Future<void> pumpLoadingWidget({Key? key}) async {
    await pumpApp(
      body: UsersLoading(key: key),
    );
  }

  Future<void> pumpLoadedWidget({
    Key? key,
    required List<User> users,
    required Future<void> Function() onRefresh,
  }) async {
    await pumpApp(
      body: UsersLoaded(
        key: key,
        users: users,
        onRefresh: onRefresh,
      ),
    );
  }

  Future<void> pumpErrorWidget({Key? key}) async {
    await pumpApp(
      body: UsersError(key: key),
    );
  }

  Future<void> pumpApp({required Widget body}) async {
    await _tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  void expectKeyFound(Key key) {
    final finder = find.byKey(key);
    expect(finder, findsOneWidget);
  }

  void expectTypeFound(Type type) {
    final finder = find.byType(type);
    expect(finder, findsOneWidget);
  }

  void expectUserDetailFound(User user) {
    expect(find.widgetWithText(CircleAvatar, '${user.id}'), findsOneWidget);
    expect(find.widgetWithText(ListTile, user.name), findsOneWidget);
    expect(find.widgetWithText(ListTile, user.username), findsOneWidget);
  }
}
