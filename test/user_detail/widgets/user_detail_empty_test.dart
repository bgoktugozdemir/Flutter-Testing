import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/widgets/widgets.dart';

import '../user_detail_robot.dart';

void main() {
  group('UserDetailEmpty', () {
    testWidgets('renders EmptyView', (tester) async {
      final robot = UserDetailRobot(tester);
      final key = UniqueKey();

      await robot.pumpEmptyWidget(key: key);

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(EmptyView), findsOneWidget);
    });
  });
}
