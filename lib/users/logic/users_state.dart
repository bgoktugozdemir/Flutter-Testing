part of 'users_cubit.dart';

enum UsersStatus { initial, loading, success, failure }

extension UserStatusX on UsersStatus {
  bool get isInitial => this == UsersStatus.initial;
  bool get isLoading => this == UsersStatus.loading;
  bool get isSuccess => this == UsersStatus.success;
  bool get isFailure => this == UsersStatus.failure;
}

class UsersState extends Equatable {
  const UsersState({required this.status, required this.users});

  factory UsersState.initial() => const UsersState(
        status: UsersStatus.initial,
        users: [],
      );

  final UsersStatus status;
  final List<User> users;

  @override
  List<Object> get props => [status, users];

  UsersState copyWith({
    UsersStatus? status,
    List<User>? users,
  }) {
    return UsersState(
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }
}
