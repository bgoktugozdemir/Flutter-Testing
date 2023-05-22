import 'package:flutter_test/flutter_test.dart';

import 'user_detail/user_detail_robot.dart';
import 'users/users_robot.dart';

class Robot {
  Robot(WidgetTester tester)
      : _tester = tester,
        usersRobot = UsersRobot(tester),
        userDetail = UserDetailRobot(tester);

  final WidgetTester _tester;

  final UsersRobot usersRobot;
  final UserDetailRobot userDetail;
}
