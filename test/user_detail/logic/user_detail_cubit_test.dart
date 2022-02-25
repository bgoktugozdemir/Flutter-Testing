import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';
import 'package:flutter_testing/user_detail/user_detail.dart';
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
  group('UserDetailCubit', () {
    late User user;
    late UserRepository userRepository;

    setUpAll(() {
      registerFallbackValue(MockUser());
    });

    setUp(() {
      user = MockUser();
      userRepository = MockUserRepository();

      when(() => user.id).thenReturn(userId);
      when(() => user.name).thenReturn(userName);
      when(() => user.username).thenReturn(userUsername);
      when(() => user.email).thenReturn(userEmail);
      when(() => user.address).thenReturn(userAddress);
      when(() => user.phone).thenReturn(userPhone);
      when(() => user.website).thenReturn(userWebsite);
      when(() => user.company).thenReturn(userCompany);
      when(() => userRepository.getUser(any())).thenAnswer((_) async => user);
    });

    test(
      'initial state is correct',
      () async {
        // ARRANGE
        final userDetailCubit = UserDetailCubit(userRepository);
        // ASSERT
        expect(userDetailCubit.state, UserDetailState.initial());
      },
    );

    group('getUser', () {
      blocTest<UserDetailCubit, UserDetailState>(
        'emits [loading, failure] when exception is thrown',
        setUp: () {
          when(() => userRepository.getUser(any()))
              .thenThrow(Exception('Oops'));
        },
        build: () => UserDetailCubit(userRepository),
        act: (cubit) => cubit.getUser(userId),
        expect: () => [
          const UserDetailState(
            status: UserDetailStatus.loading,
            user: User.empty(),
          ),
          const UserDetailState(
            status: UserDetailStatus.failure,
            user: User.empty(),
          ),
        ],
      );

      blocTest<UserDetailCubit, UserDetailState>(
        'emits [loading, success] when getUser returns user',
        build: () => UserDetailCubit(userRepository),
        act: (cubit) => cubit.getUser(userId),
        expect: () => [
          const UserDetailState(
            status: UserDetailStatus.loading,
            user: User.empty(),
          ),
          isA<UserDetailState>()
              .having((u) => u.status, 'status', UserDetailStatus.success)
              .having(
                (u) => u.user,
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
        ],
      );
    });
  });
}
