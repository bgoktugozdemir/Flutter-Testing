import 'package:flutter/material.dart';
import 'package:flutter_testing/core/widgets/widgets.dart';

class UserDetailEmpty extends StatelessWidget {
  const UserDetailEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EmptyView(Icons.person);
  }
}
