import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';

part 'user_detail_state.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  UserDetailCubit([UserRepository? userRepository])
      : _userRepository = userRepository ?? UserRepository(),
        super(UserDetailState.initial());

  final UserRepository _userRepository;

  Future<void> getUser(int userId) async {
    emit(state.copyWith(status: UserDetailStatus.loading));

    try {
      final user = await _userRepository.getUser(userId);

      emit(state.copyWith(
        status: UserDetailStatus.success,
        user: user,
      ));
    } catch (e) {
      emit(state.copyWith(status: UserDetailStatus.failure));
    }
  }
}
