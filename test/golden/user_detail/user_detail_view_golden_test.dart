import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/user_detail/user_detail.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

class MockUserDetailCubit extends MockCubit<UserDetailState>
    implements UserDetailCubit {}

void main() {
  group('UserDetailView', () {
    late UserDetailCubit userDetailCubit;
    late Widget widget;

    setUp(() {
      userDetailCubit = MockUserDetailCubit();
      widget = BlocProvider.value(
        value: userDetailCubit,
        child: const UserDetailView(),
      );
    });

    testGoldens(
      'should render empty view when state is initial',
      (tester) async {
        when(() => userDetailCubit.state).thenReturn(UserDetailState.initial());

        final builder = DeviceBuilder()
          ..addScenario(
            name: 'UserDetailView-Empty',
            widget: widget,
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'user_detail_view_empty');
      },
      tags: ['golden'],
    );

    testGoldens(
      'should render loading view when state is loading',
      (tester) async {
        when(() => userDetailCubit.state).thenReturn(
          UserDetailState.initial().copyWith(
            status: UserDetailStatus.loading,
          ),
        );

        final builder = DeviceBuilder()
          ..addScenario(
            name: 'UserDetailView-Loading',
            widget: widget,
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(
          tester,
          'user_detail_view_loading',
          customPump: (tester) => tester.pump(
            const Duration(seconds: 2),
          ),
        );
      },
      tags: ['golden'],
    );

    testGoldens(
      'should render loaded view when state is success',
      (tester) async {
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
        when(() => userDetailCubit.state).thenReturn(const UserDetailState(
          status: UserDetailStatus.success,
          user: user,
        ));

        final builder = DeviceBuilder()
          ..addScenario(
            name: 'UserDetailView-Loaded',
            widget: widget,
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'user_detail_view_loaded');
      },
      tags: ['golden'],
    );

    testGoldens(
      'should render error view when state is failure',
      (tester) async {
        when(() => userDetailCubit.state).thenReturn(
          UserDetailState.initial().copyWith(
            status: UserDetailStatus.failure,
          ),
        );

        final builder = DeviceBuilder()
          ..addScenario(
            name: 'UserDetailView-Error',
            widget: widget,
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'user_detail_view_error');
      },
      tags: ['golden'],
    );
  });
}
