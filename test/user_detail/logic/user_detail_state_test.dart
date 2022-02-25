import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';
import 'package:flutter_testing/user_detail/user_detail.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group('UserDetailState', () {
    group('copyWith', () {
      late UserRepository userRepository;

      late UserDetailCubit userDetailCubit;

      setUp(() {
        userRepository = MockUserRepository();
        userDetailCubit = UserDetailCubit(userRepository);
      });

      tearDown(() {
        userDetailCubit.close();
        userRepository.close();
      });

      test(
        'should return the same state when copyWith is called without parameters',
        () async {
          // ARRANGE
          final expected = userDetailCubit.state;
          // ACT
          final state = userDetailCubit.state.copyWith();
          // ASSERT
          expect(state, equals(expected));
        },
      );

      test(
        'should return the correct state when only status is changed by copyWith',
        () async {
          // ARRANGE
          const expected = UserDetailState(
            status: UserDetailStatus.loading,
            user: User.empty(),
          );
          // ACT
          final state = userDetailCubit.state.copyWith(
            status: UserDetailStatus.loading,
          );
          // ASSERT
          expect(state, equals(expected));
        },
      );

      test(
        'should return the correct state when only user is changed by coptyWith',
        () async {
          // ARRANGE
          const user = User.empty();
          const expected = UserDetailState(
            status: UserDetailStatus.initial,
            user: user,
          );
          // ACT
          final state = userDetailCubit.state.copyWith(user: user);
          // ASSERT
          expect(state, equals(expected));
        },
      );

      test(
        'should return the correct state when all parameters are changed by coptyWith',
        () async {
          // ARRANGE
          const user = User.empty();
          const expected = UserDetailState(
            status: UserDetailStatus.success,
            user: user,
          );
          // ACT
          final state = userDetailCubit.state.copyWith(
            user: user,
            status: UserDetailStatus.success,
          );
          // ASSERT
          expect(state, equals(expected));
        },
      );
    });
  });
}
