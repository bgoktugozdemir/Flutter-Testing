part of 'user_detail_cubit.dart';

enum UserDetailStatus { initial, loading, success, failure }

class UserDetailState extends Equatable {
  const UserDetailState({
    required this.status,
    required this.user,
  });

  factory UserDetailState.initial() => const UserDetailState(
        status: UserDetailStatus.initial,
        user: User.empty(),
      );

  final UserDetailStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];

  UserDetailState copyWith({
    UserDetailStatus? status,
    User? user,
  }) {
    return UserDetailState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
