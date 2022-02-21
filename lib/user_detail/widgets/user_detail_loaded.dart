import 'package:flutter/material.dart';
import 'package:flutter_testing/core/models/models.dart';

class UserDetailLoaded extends StatelessWidget {
  const UserDetailLoaded({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            '${user.id}',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    );
  }
}
