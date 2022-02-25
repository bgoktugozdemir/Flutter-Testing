import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';
import 'package:flutter_testing/user_detail/user_detail.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserDetailCubit(context.read<UserRepository>())..getUser(userId),
      child: const UserDetailView(),
    );
  }
}

class UserDetailView extends StatelessWidget {
  const UserDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail'),
      ),
      body: Center(
        child: BlocBuilder<UserDetailCubit, UserDetailState>(
          builder: (context, state) {
            switch (state.status) {
              case UserDetailStatus.initial:
                return const UserDetailEmpty();
              case UserDetailStatus.loading:
                return const UserDetailLoading();
              case UserDetailStatus.success:
                return UserDetailLoaded(user: state.user);
              case UserDetailStatus.failure:
                return const UserDetailError();
            }
          },
        ),
      ),
    );
  }
}
