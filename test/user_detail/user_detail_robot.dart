import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/user_detail/widgets/widgets.dart';

class UserDetailRobot {
  const UserDetailRobot(WidgetTester tester) : _tester = tester;

  final WidgetTester _tester;

  Future<void> pumpEmptyWidget({Key? key}) async {
    await pumpApp(
      body: UserDetailEmpty(key: key),
    );
  }

  Future<void> pumpLoadingWidget({Key? key}) async {
    await pumpApp(
      body: UserDetailLoading(key: key),
    );
  }

  Future<void> pumpLoadedWidget({Key? key, required User user}) async {
    await pumpApp(
      body: UserDetailLoaded(
        key: key,
        user: user,
      ),
    );
  }

  Future<void> pumpErrorWidget({Key? key}) async {
    await pumpApp(
      body: UserDetailError(key: key),
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
}
