import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/widgets/widgets.dart';

import '../users_robot.dart';

void main() {
  group('UsersError', () {
    testWidgets('renders ErrorView', (tester) async {
      final robot = UsersRobot(tester);
      final key = UniqueKey();

      await robot.pumpErrorWidget(key: key);

      robot.expectKeyFound(key);
      robot.expectTypeFound(ErrorView);
    });
  });
}
