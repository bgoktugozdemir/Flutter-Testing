import 'package:flutter/material.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/user_detail/user_detail.dart';

class UsersLoaded extends StatelessWidget {
  const UsersLoaded({
    Key? key,
    required this.users,
    required this.onRefresh,
  }) : super(key: key);

  final List<User> users;
  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UserDetailPage(userId: user.id),
              ),
            ),
            leading: CircleAvatar(
              child: Text(
                '${user.id}',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(user.name),
            subtitle: Text(user.username),
          );
        },
      ),
    );
  }
}
