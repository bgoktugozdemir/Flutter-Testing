import 'package:flutter/material.dart';
import 'package:flutter_testing/core/widgets/widgets.dart';

class UserDetailLoading extends StatelessWidget {
  const UserDetailLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Loading(message: 'Loading user...');
  }
}
