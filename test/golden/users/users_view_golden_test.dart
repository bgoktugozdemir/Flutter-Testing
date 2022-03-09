import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/users/logic/users_cubit.dart';
import 'package:flutter_testing/users/view/users_page.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

class MockUsersCubit extends MockCubit<UsersState> implements UsersCubit {}

void main() {
  group('UsersView', () {
    late UsersCubit usersCubit;
    late Widget widget;

    setUp(() {
      usersCubit = MockUsersCubit();
      widget = BlocProvider.value(
        value: usersCubit,
        child: const UsersView(),
      );
    });

    testGoldens(
      'should render empty view when state is initial',
      (tester) async {
        when(() => usersCubit.state).thenReturn(UsersState.initial());

        final builder = DeviceBuilder()
          ..addScenario(
            name: 'UsersView-Empty',
            widget: widget,
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'users_view_empty');
      },
    );

    testGoldens(
      'should render loading view when state is loading',
      (tester) async {
        when(() => usersCubit.state).thenReturn(
          UsersState.initial().copyWith(
            status: UsersStatus.loading,
          ),
        );

        final builder = DeviceBuilder()
          ..addScenario(
            name: 'UsersView-Loading',
            widget: widget,
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(
          tester,
          'users_view_loading',
          customPump: (tester) async => tester.pump(
            const Duration(seconds: 2),
          ),
        );
      },
    );

    testGoldens(
      'should render loaded view when state is success',
      (tester) async {
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
        when(() => usersCubit.state).thenReturn(
          UsersState.initial().copyWith(
            status: UsersStatus.success,
            users: users,
          ),
        );

        final builder = DeviceBuilder()
          ..addScenario(
            name: 'UsersView-Loaded',
            widget: widget,
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'users_view_loaded');
      },
    );

    testGoldens(
      'should render error view when state is failure',
      (tester) async {
        when(() => usersCubit.state).thenReturn(
          UsersState.initial().copyWith(
            status: UsersStatus.failure,
          ),
        );

        final builder = DeviceBuilder()
          ..addScenario(
            name: 'UsersView-Error',
            widget: widget,
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'users_view_error');
      },
    );
  });
}
