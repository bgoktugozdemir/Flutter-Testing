import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';
import 'package:flutter_testing/users/view/users_page.dart';

void main({
  UserRepository? userRepository,
}) {
  final _userRepository = userRepository ?? UserRepository();
  runApp(
    RepositoryProvider.value(
      value: _userRepository,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UsersPage(),
      ),
    ),
  );
}
