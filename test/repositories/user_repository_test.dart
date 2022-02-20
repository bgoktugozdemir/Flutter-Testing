import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/exceptions/exceptions.dart';
import 'package:flutter_testing/models/user.dart';
import 'package:flutter_testing/repositories/repositories.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  late MockClient mockClient;
  late UserRepository userRepository;

  setUpAll(() {
    registerFallbackValue(FakeUri());
  });

  setUp(() {
    mockClient = MockClient();
    userRepository = UserRepository(client: mockClient);
  });

  tearDown(() {
    userRepository.close();
    mockClient.close();
  });
  group('UserRepository', () {
    test(
      'should create UserRepository without client',
      () async {
        // ACT
        final userRepository = UserRepository();

        // ASSERT
        expect(userRepository, isA<BaseRepository>());
        expect(userRepository, isA<UserRepository>());
      },
    );
    group('getUsers', () {
      test(
        'should return List<User> when status code is 200',
        () async {
          // ARRANGE
          const fakeBody =
              '[{"id":1,"name":"Leanne Graham","username":"Bret","email":"Sincere@april.biz","address":{"street":"Kulas Light","suite":"Apt. 556","city":"Gwenborough","zipcode":"92998-3874","geo":{"lat":"-37.3159","lng":"81.1496"}},"phone":"1-770-736-8031 x56442","website":"hildegard.org","company":{"name":"Romaguera-Crona","catchPhrase":"Multi-layered client-server neural-net","bs":"harness real-time e-markets"}},{"id":2,"name":"Ervin Howell","username":"Antonette","email":"Shanna@melissa.tv","address":{"street":"Victor Plains","suite":"Suite 879","city":"Wisokyburgh","zipcode":"90566-7771","geo":{"lat":"-43.9509","lng":"-34.4618"}},"phone":"010-692-6593 x09125","website":"anastasia.net","company":{"name":"Deckow-Crist","catchPhrase":"Proactive didactic contingency","bs":"synergize scalable supply-chains"}}]';

          final fakeResponse = Response(fakeBody, 200);
          when(() => mockClient.get(any()))
              .thenAnswer((_) async => fakeResponse);
          // ACT
          final result = await userRepository.getUsers();
          // ASSERT
          expect(result, isA<List<User>>());
          expect(result.length, 2);
        },
      );

      test(
        'should return List<User> even if response is empty list when status code is 200',
        () async {
          // ARRANGE
          final fakeResponse = Response('[]', 200);
          when(() => mockClient.get(any()))
              .thenAnswer((_) async => fakeResponse);
          // ACT
          final result = await userRepository.getUsers();
          // ASSERT
          expect(result, isA<List<User>>());
        },
      );

      test(
        'should throw a RepositoryStatusCodeException when status code is not 200',
        () async {
          // ARRANGE
          final fakeResponse = Response('', 404);
          when(() => mockClient.get(any()))
              .thenAnswer((_) async => fakeResponse);
          // ASSERT
          expect(
            () => userRepository.getUsers(),
            throwsA(isA<RepositoryStatusCodeException>()),
          );
        },
      );

      test(
        'should throw a RepositoryException when Client throws an Exception',
        () async {
          // ARRANGE
          when(() => mockClient.get(any())).thenThrow(Exception());
          // ASSERT
          expect(
            () => userRepository.getUsers(),
            throwsA(isA<RepositoryException>()),
          );
        },
      );
    });
  });
}
