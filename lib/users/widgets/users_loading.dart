import 'package:flutter/material.dart';
import 'package:flutter_testing/core/widgets/widgets.dart';

class UsersLoading extends StatelessWidget {
  const UsersLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingView(message: 'Loading users...');
  }
}
