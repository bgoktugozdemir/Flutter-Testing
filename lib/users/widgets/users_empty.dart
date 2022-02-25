import 'package:flutter/material.dart';
import 'package:flutter_testing/core/widgets/widgets.dart';

class UsersEmpty extends StatelessWidget {
  const UsersEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EmptyView(Icons.people);
  }
}
