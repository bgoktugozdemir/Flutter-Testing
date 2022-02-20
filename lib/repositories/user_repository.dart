import 'package:flutter_testing/exceptions/repository_exception.dart';
import 'package:flutter_testing/models/models.dart';
import 'package:flutter_testing/repositories/base_repository.dart';

class UserRepository extends BaseRepository {
  UserRepository({
    Client? client,
  }) : super(client);

  Future<List<User>> getUsers() async {
    final response = await get<List>('/users').catchError((error) {
      if (error is RepositoryException) {
        throw error;
      } else {
        throw const RepositoryException();
      }
    });

    return response.map((e) => User.fromJson(e)).toList();
  }

  Future<User> getUser(int id) async {
    final response =
        await get<Map<String, dynamic>>('/users/$id').catchError((error) {
      if (error is RepositoryException) {
        throw error;
      } else {
        throw const RepositoryException();
      }
    });

    final user = User.fromJson(response);

    return user;
  }
}
