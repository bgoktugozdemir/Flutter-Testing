import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';
import 'package:flutter_testing/users/users.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group('UsersPage', () {
    const users = <User>[
      User(
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
      ),
      User(
        id: 2,
        name: "Ervin Howell",
        username: "Antonette",
        email: "Shanna@melissa.tv",
        address: Address(
          street: 'Victor Plains',
          suite: 'Suite 879',
          city: 'Wisokyburgh',
          zipcode: '90566-7771',
          geo: Geo(lat: '-43.9509', lng: '-34.4618'),
        ),
        phone: "010-692-6593 x09125",
        website: "anastasia.net",
        company: Company(
          name: 'Deckow-Crist',
          catchPhrase: 'Proactive didactic contingency',
          bs: 'synergize scalable supply-chains',
        ),
      )
    ];

    late UserRepository userRepository;

    late Widget widget;

    setUp(() {
      userRepository = MockUserRepository();
      widget = RepositoryProvider.value(
        value: userRepository,
        child: const UsersPage(),
      );
    });

    testGoldens(
      'should render loading view while users are loading',
      (tester) async {
        when(() => userRepository.getUsers()).thenAnswer(
          (_) async => Future.delayed(
            const Duration(seconds: 2),
            () async => users,
          ),
        );

        final builder = DeviceBuilder()
          ..addScenario(
            name: 'UsersPage-Loading',
            widget: widget,
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(
          tester,
          'users_page_loading',
          customPump: (p0) => p0.pump(const Duration(milliseconds: 500)),
        );

        await tester.pumpAndSettle();
      },
    );

    testGoldens(
      'should render users when users loaded',
      (tester) async {
        when(() => userRepository.getUsers()).thenAnswer((_) async => users);

        final builder = DeviceBuilder()
          ..addScenario(
            name: 'UsersPage-Loaded',
            widget: widget,
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'users_page_loaded');
      },
    );

    testGoldens(
      'should render error view when getUsers throws an exception',
      (tester) async {
        when(() => userRepository.getUsers()).thenThrow(Exception());

        final builder = DeviceBuilder()
          ..addScenario(
            name: 'UsersPage-Error',
            widget: widget,
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'users_page_error');
      },
    );
  });
}
