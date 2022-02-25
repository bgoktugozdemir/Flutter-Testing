import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';
import 'package:flutter_testing/user_detail/user_detail.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockUserDetailCubit extends MockCubit<UserDetailState>
    implements UserDetailCubit {}

void main() {
  group('UserDetailPage', () {
    late UserRepository userRepository;

    setUp(() {
      userRepository = MockUserRepository();
    });

    testWidgets(
      "renders UserDetailView",
      (WidgetTester tester) async {
        when(() => userRepository.getUser(any()))
            .thenAnswer((_) async => const User.empty());
        await tester.pumpWidget(
          RepositoryProvider.value(
            value: userRepository,
            child: const MaterialApp(
              home: UserDetailPage(userId: 0),
            ),
          ),
        );

        expect(find.byType(UserDetailView), findsOneWidget);
      },
    );

    group('UserDetailView', () {
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

      late UserDetailCubit userDetailCubit;

      setUp(() {
        userDetailCubit = MockUserDetailCubit();
      });

      tearDown(() async {
        await userDetailCubit.close();
      });

      testWidgets(
        "renders UserDetailEmpty when status is UserDetailStatus.initial",
        (WidgetTester tester) async {
          when(() => userDetailCubit.state)
              .thenReturn(UserDetailState.initial());

          await tester.pumpWidget(
            BlocProvider.value(
              value: userDetailCubit,
              child: const MaterialApp(
                home: UserDetailView(),
              ),
            ),
          );

          expect(find.byType(UserDetailEmpty), findsOneWidget);
        },
      );

      testWidgets(
        "renders UserDetailLoading when status is UserDetailStatus.loading",
        (WidgetTester tester) async {
          when(() => userDetailCubit.state).thenReturn(
            const UserDetailState(
              status: UserDetailStatus.loading,
              user: User.empty(),
            ),
          );

          await tester.pumpWidget(
            BlocProvider.value(
              value: userDetailCubit,
              child: const MaterialApp(
                home: UserDetailView(),
              ),
            ),
          );

          expect(find.byType(UserDetailLoading), findsOneWidget);
        },
      );

      testWidgets(
        "renders UserDetailLoaded when status is UserDetailStatus.success",
        (WidgetTester tester) async {
          when(() => userDetailCubit.state).thenReturn(
            const UserDetailState(
              status: UserDetailStatus.success,
              user: user,
            ),
          );

          await tester.pumpWidget(
            BlocProvider.value(
              value: userDetailCubit,
              child: const MaterialApp(
                home: UserDetailView(),
              ),
            ),
          );

          expect(find.byType(UserDetailLoaded), findsOneWidget);
        },
      );

      testWidgets(
        "renders UserDetailError when status is UserDetailStatus.failure",
        (WidgetTester tester) async {
          when(() => userDetailCubit.state).thenReturn(
            const UserDetailState(
              status: UserDetailStatus.failure,
              user: User.empty(),
            ),
          );

          await tester.pumpWidget(
            BlocProvider.value(
              value: userDetailCubit,
              child: const MaterialApp(
                home: UserDetailView(),
              ),
            ),
          );

          expect(find.byType(UserDetailError), findsOneWidget);
        },
      );
    });
  });
}
