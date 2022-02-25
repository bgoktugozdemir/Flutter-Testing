import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';
import 'package:flutter_testing/users/users.dart';

class App extends StatelessWidget {
  const App({Key? key, required UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _userRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UsersPage(),
    );
  }
}
