import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/user_detail/widgets/user_detail_error.dart';

import '../user_detail_robot.dart';

void main() {
  group('UserDetailError', () {
    testWidgets('renders ErrorView', (tester) async {
      final robot = UserDetailRobot(tester);
      final key = UniqueKey();

      await robot.pumpErrorWidget(key: key);

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(UserDetailError), findsOneWidget);
    });
  });
}
