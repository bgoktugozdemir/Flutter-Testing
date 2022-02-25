import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
    this.message = 'Something went wrong!',
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Icon(Icons.error, size: 64),
        ),
        Text(
          message,
          style: Theme.of(context).textTheme.headline5,
        )
      ],
    );
  }
}
