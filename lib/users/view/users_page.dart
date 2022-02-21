import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing/users/logic/users_cubit.dart';
import 'package:flutter_testing/users/users.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit()..getUsers(),
      child: const UsersView(),
    );
  }
}

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Center(
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            switch (state.status) {
              case UsersStatus.initial:
                return const UsersEmpty();
              case UsersStatus.loading:
                return const UsersLoading();
              case UsersStatus.success:
                return UsersLoaded(
                  users: state.users,
                  onRefresh: context.read<UsersCubit>().refreshUsers,
                );
              case UsersStatus.failure:
                return const UsersError();
            }
          },
        ),
      ),
    );
  }
}
