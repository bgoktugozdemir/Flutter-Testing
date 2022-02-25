import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(UserRepository userRepository)
      : _userRepository = userRepository,
        super(UsersState.initial());

  final UserRepository _userRepository;

  Future<void> getUsers() async {
    emit(state.copyWith(status: UsersStatus.loading));

    await _getUsers();
  }

  Future<void> refreshUsers() async {
    if (!state.status.isSuccess || state.users.isEmpty) {
      return;
    }

    await _getUsers();
  }

  Future<void> _getUsers() async {
    try {
      final users = await _userRepository.getUsers();

      emit(state.copyWith(
        status: UsersStatus.success,
        users: users,
      ));
    } on Exception {
      emit(state.copyWith(status: UsersStatus.failure));
    }
  }
}
