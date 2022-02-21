import 'package:flutter/material.dart';
import 'package:flutter_testing/core/widgets/widgets.dart';

class UsersLoading extends StatelessWidget {
  const UsersLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Loading(message: 'Loading users...');
  }
}
