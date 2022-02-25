import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';
import 'package:flutter_testing/user_detail/user_detail.dart';
import 'package:flutter_testing/users/logic/users_cubit.dart';
import 'package:flutter_testing/users/users.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockUsersCubit extends MockCubit<UsersState> implements UsersCubit {}

void main() {
  group('UsersPage', () {
    late UserRepository userRepository;

    setUp(() {
      userRepository = MockUserRepository();
    });
    testWidgets('renders UsersView', (tester) async {
      when(() => userRepository.getUsers())
          .thenAnswer((_) async => const [User.empty()]);
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: userRepository,
          child: const MaterialApp(
            home: UsersPage(),
          ),
        ),
      );

      expect(find.byType(UsersView), findsOneWidget);
    });
  });

  group('UsersView', () {
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

    late UsersCubit usersCubit;

    setUp(() {
      usersCubit = MockUsersCubit();
    });

    tearDown(() async {
      await usersCubit.close();
    });

    testWidgets(
      'renders UsersEmpty when status is UsersStatus.initial',
      (tester) async {
        when(() => usersCubit.state).thenReturn(UsersState.initial());

        await tester.pumpWidget(
          BlocProvider.value(
            value: usersCubit,
            child: const MaterialApp(
              home: UsersView(),
            ),
          ),
        );

        expect(find.byType(UsersEmpty), findsOneWidget);
      },
    );

    testWidgets(
      'renders UsersLoading when status is UsersStatus.loading',
      (tester) async {
        when(() => usersCubit.state).thenReturn(
          const UsersState(status: UsersStatus.loading, users: []),
        );

        await tester.pumpWidget(
          BlocProvider.value(
            value: usersCubit,
            child: const MaterialApp(
              home: UsersView(),
            ),
          ),
        );

        expect(find.byType(UsersLoading), findsOneWidget);
      },
    );

    testWidgets(
      'renders UsersLoaded when status is UserStatus.success',
      (tester) async {
        when(() => usersCubit.state).thenReturn(
          const UsersState(status: UsersStatus.success, users: users),
        );

        await tester.pumpWidget(
          BlocProvider.value(
            value: usersCubit,
            child: const MaterialApp(
              home: UsersView(),
            ),
          ),
        );

        expect(find.byType(UsersLoaded), findsOneWidget);
      },
    );

    testWidgets(
      'renders UsersError when status is UserStatus.failure',
      (tester) async {
        when(() => usersCubit.state).thenReturn(
          const UsersState(status: UsersStatus.failure, users: []),
        );

        await tester.pumpWidget(
          BlocProvider.value(
            value: usersCubit,
            child: const MaterialApp(
              home: UsersView(),
            ),
          ),
        );

        expect(find.byType(UsersError), findsOneWidget);
      },
    );

    testWidgets(
      'navigates to UserDetailPage when tapped on user',
      (tester) async {
        final UserRepository userRepository = MockUserRepository();
        when(() => userRepository.getUser(any()))
            .thenAnswer((_) async => const User.empty());
        when(() => usersCubit.state).thenReturn(
          const UsersState(status: UsersStatus.success, users: users),
        );

        await tester.pumpWidget(
          RepositoryProvider.value(
            value: userRepository,
            child: BlocProvider.value(
              value: usersCubit,
              child: const MaterialApp(
                home: UsersView(),
              ),
            ),
          ),
        );
        await tester.tap(find.byType(ListTile).first);
        await tester.pumpAndSettle();

        expect(find.byType(UserDetailPage), findsOneWidget);
      },
    );

    testWidgets(
      'triggers refreshUsers on pull to refresh',
      (tester) async {
        when(() => usersCubit.state).thenReturn(
          const UsersState(status: UsersStatus.success, users: users),
        );
        when(() => usersCubit.refreshUsers()).thenAnswer((_) async => {});

        await tester.pumpWidget(
          BlocProvider.value(
            value: usersCubit,
            child: const MaterialApp(
              home: UsersView(),
            ),
          ),
        );

        await tester.fling(
          find.byType(UsersLoaded),
          const Offset(0, 500),
          1000,
        );

        await tester.pumpAndSettle();

        verify(() => usersCubit.refreshUsers()).called(1);
      },
    );
  });
}
