import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';
import 'package:flutter_testing/users/logic/users_cubit.dart';
import 'package:mocktail/mocktail.dart';

const userId = 1;
const userName = 'Leanne Graham';
const userUsername = 'Bret';
const userEmail = 'Sincere@april.biz';
const userAddress = Address(
  street: 'Kulas Light',
  suite: 'Apt. 556',
  city: 'Gwenborough',
  zipcode: '92998-3874',
  geo: Geo(lat: '-37.3159', lng: '81.1496'),
);
const userPhone = '1-770-736-8031 x56442';
const userWebsite = 'hildegard.org';
const userCompany = Company(
  name: 'Romaguera-Crona',
  catchPhrase: 'Multi-layered client-server neural-net',
  bs: 'harness real-time e-markets',
);

class MockUserRepository extends Mock implements UserRepository {}

class MockUser extends Mock implements User {}

void main() {
  group('UsersCubit', () {
    late List<User> users;
    late UserRepository userRepository;

    setUp(() {
      users = [MockUser(), MockUser()];
      userRepository = MockUserRepository();

      when(() => users.first.id).thenReturn(userId);
      when(() => users.first.name).thenReturn(userName);
      when(() => users.first.username).thenReturn(userUsername);
      when(() => users.first.email).thenReturn(userEmail);
      when(() => users.first.address).thenReturn(userAddress);
      when(() => users.first.phone).thenReturn(userPhone);
      when(() => users.first.website).thenReturn(userWebsite);
      when(() => users.first.company).thenReturn(userCompany);
      when(() => userRepository.getUsers()).thenAnswer((_) async => users);
    });

    test(
      'initial state is correct',
      () {
        // ARRANGE
        final usersCubit = UsersCubit();
        // ASSERT
        expect(usersCubit.state, UsersState.initial());
      },
    );

    group('getUsers', () {
      blocTest<UsersCubit, UsersState>(
        'emits [loading, failure] when exception is thrown',
        setUp: () {
          when(() => userRepository.getUsers()).thenThrow(Exception('Oops'));
        },
        build: () => UsersCubit(userRepository),
        act: (cubit) => cubit.getUsers(),
        expect: () => [
          const UsersState(status: UsersStatus.loading, users: []),
          const UsersState(status: UsersStatus.failure, users: []),
        ],
      );

      blocTest<UsersCubit, UsersState>(
        'emits [loading, success] when getUsers returns users',
        setUp: () {
          when(() => userRepository.getUsers()).thenAnswer((_) async => users);
        },
        build: () => UsersCubit(userRepository),
        act: (cubit) => cubit.getUsers(),
        expect: () => [
          const UsersState(status: UsersStatus.loading, users: []),
          isA<UsersState>()
              .having((u) => u.status, 'status', UsersStatus.success)
              .having(
                (u) => u.users,
                'users',
                isA<List<User>>()
                    .having((u) => u, 'list of user', users)
                    .having(
                      (u) => u.first,
                      'user',
                      isA<User>()
                          .having((u) => u.id, 'id', userId)
                          .having((u) => u.name, 'name', userName)
                          .having((u) => u.username, 'username', userUsername)
                          .having((u) => u.email, 'email', userEmail)
                          .having((u) => u.address, 'address', userAddress)
                          .having((u) => u.phone, 'phone', userPhone)
                          .having((u) => u.website, 'website', userWebsite)
                          .having((u) => u.company, 'company', userCompany),
                    ),
              ),
        ],
      );
    });

    group('refreshUsers', () {
      blocTest<UsersCubit, UsersState>(
        'emits nothing when status is not success',
        build: () => UsersCubit(userRepository),
        act: (cubit) => cubit.refreshUsers(),
        expect: () => [],
        verify: (_) {
          verifyNever(() => userRepository.getUsers());
        },
      );

      blocTest<UsersCubit, UsersState>(
        'emits nothing when users is empty',
        build: () => UsersCubit(userRepository),
        seed: () => const UsersState(status: UsersStatus.success, users: []),
        act: (cubit) => cubit.refreshUsers(),
        expect: () => [],
      );

      blocTest<UsersCubit, UsersState>(
        'emits [failure] when exception is thrown',
        setUp: () {
          when(() => userRepository.getUsers()).thenThrow(Exception('Oops'));
        },
        seed: () => UsersState(status: UsersStatus.success, users: users),
        build: () => UsersCubit(userRepository),
        act: (cubit) => cubit.refreshUsers(),
        expect: () => [
          UsersState(status: UsersStatus.failure, users: users),
        ],
      );

      blocTest<UsersCubit, UsersState>(
        'emits [success] when it is updated',
        setUp: () {
          when(() => userRepository.getUsers()).thenAnswer(
              (_) async => const [User.empty(), User.empty(), User.empty()]);
        },
        build: () => UsersCubit(userRepository),
        seed: () => const UsersState(
            status: UsersStatus.success, users: [User.empty(), User.empty()]),
        act: (cubit) => cubit.refreshUsers(),
        expect: () => [
          const UsersState(status: UsersStatus.success, users: [
            User.empty(),
            User.empty(),
            User.empty(),
          ]),
        ],
      );
    });
  });
}
