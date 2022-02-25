import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key, this.message = 'Loading...'}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
        Text(
          message,
          style: Theme.of(context).textTheme.headline5,
        )
      ],
    );
  }
}
