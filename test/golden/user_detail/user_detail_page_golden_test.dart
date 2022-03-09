import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';
import 'package:flutter_testing/user_detail/user_detail.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group('UserDetailPage', () {
    late UserRepository userRepository;

    late Widget widget;

    const user = User(
      id: 1,
      name: "Leanne Graham",
      username: "Bret",
      email: "Sincere@april.biz",
      address: Address(
        street: 'Kulas Light',
        suite: 'Apt. 556',
        city: 'Gwenborough',
        zipcode: '92998-3874',
        geo: Geo(lat: '-37.3159', lng: '81.1496'),
      ),
      phone: "1-770-736-8031 x56442",
      website: "hildegard.org",
      company: Company(
        name: 'Romaguera-Crona',
        catchPhrase: 'Multi-layered client-server neural-net',
        bs: 'harness real-time e-markets',
      ),
    );

    setUp(() {
      userRepository = MockUserRepository();
      widget = RepositoryProvider.value(
        value: userRepository,
        child: const UserDetailPage(userId: 1),
      );
    });

    testGoldens(
      'should render user detail when user loaded',
      (tester) async {
        when(() => userRepository.getUser(any())).thenAnswer((_) async => user);

        final builder = DeviceBuilder()
          ..addScenario(
            name: 'UserDetailPage-Loaded',
            widget: widget,
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'user_detail_page_loaded');
      },
    );

    testGoldens(
      'should render error view when getUser throws an exception',
      (tester) async {
        when(() => userRepository.getUser(any())).thenThrow(Exception());

        final builder = DeviceBuilder()
          ..addScenario(
            name: 'UserDetailPage-Error',
            widget: widget,
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'user_detail_page_error');
      },
    );
  });
}
