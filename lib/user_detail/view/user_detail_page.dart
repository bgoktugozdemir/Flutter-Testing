import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/user_detail/user_detail.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({
    Key? key,
    this.userId,
    this.user,
  })  : assert(userId != null || user != null),
        super(key: key);

  final int? userId;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailCubit(),
      child: const UserDetailView(),
    );
  }
}

class UserDetailView extends StatelessWidget {
  const UserDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
