import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';
import 'package:flutter_testing/users/logic/users_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group('UsersState', () {
    group('UsersStatusX', () {
      test(
        'returns correct values for UsersStatus.initial',
        () {
          // ARRANGE
          const status = UsersStatus.initial;
          // ASSERT
          expect(status.isInitial, isTrue);
          expect(status.isLoading, isFalse);
          expect(status.isSuccess, isFalse);
          expect(status.isFailure, isFalse);
        },
      );

      test(
        'returns correct values for UsersStatus.loading',
        () {
          // ARRANGE
          const status = UsersStatus.loading;
          // ASSERT
          expect(status.isInitial, isFalse);
          expect(status.isLoading, isTrue);
          expect(status.isSuccess, isFalse);
          expect(status.isFailure, isFalse);
        },
      );

      test(
        'returns correct values for UsersStatus.success',
        () {
          // ARRANGE
          const status = UsersStatus.success;
          // ASSERT
          expect(status.isInitial, isFalse);
          expect(status.isLoading, isFalse);
          expect(status.isSuccess, isTrue);
          expect(status.isFailure, isFalse);
        },
      );

      test(
        'returns correct values for UsersStatus.failure',
        () {
          // ARRANGE
          const status = UsersStatus.failure;
          // ASSERT
          expect(status.isInitial, isFalse);
          expect(status.isLoading, isFalse);
          expect(status.isSuccess, isFalse);
          expect(status.isFailure, isTrue);
        },
      );
    });

    group('copyWith', () {
      late UsersCubit usersCubit;
      late UserRepository userRepository;

      setUp(() {
        userRepository = MockUserRepository();
        usersCubit = UsersCubit(userRepository);
      });

      tearDown(() async {
        usersCubit.close();
      });

      test(
        'should return the same state when copyWith is called without parameters',
        () async {
          // ARRANGE
          final expected = usersCubit.state;
          // ACT
          final state = usersCubit.state.copyWith();
          // ASSERT
          expect(state, equals(expected));
        },
      );

      test(
        'should return correct state when only status is changed by copyWith',
        () async {
          // ARRANGE
          const expected = UsersState(status: UsersStatus.loading, users: []);
          // ACT
          final state = usersCubit.state.copyWith(status: UsersStatus.loading);
          // ASSERT
          expect(state, equals(expected));
        },
      );

      test(
        'should return correct state when only users is changed by copyWith',
        () async {
          // ARRANGE
          const users = [User.empty()];
          const expected = UsersState(
            status: UsersStatus.initial,
            users: users,
          );
          // ACT
          final state = usersCubit.state.copyWith(users: users);
          // ASSERT
          expect(state, equals(expected));
        },
      );

      test(
          'should return correct state when all parameters are changed by copyWith',
          () async {
        const users = [User.empty()];
        const expected = UsersState(
          status: UsersStatus.success,
          users: users,
        );
        // ACT
        final state = usersCubit.state.copyWith(
          users: users,
          status: UsersStatus.success,
        );
        // ASSERT
        expect(state, equals(expected));
      });
    });
  });
}
