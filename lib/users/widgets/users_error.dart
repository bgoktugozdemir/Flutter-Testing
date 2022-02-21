import 'package:flutter/material.dart';

class UsersError extends StatelessWidget {
  const UsersError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.error, size: 64),
        Text(
          'Something went wrong!',
          style: Theme.of(context).textTheme.headline5,
        )
      ],
    );
  }
}
