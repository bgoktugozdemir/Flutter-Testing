import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/models/models.dart';

void main() {
  late User user;

  setUpAll(() {
    user = const User(
      id: 1,
      name: "Leanne Graham",
      username: "Bret",
      email: "Sincere@april.biz",
      address: Address(
        street: 'Kulas Light',
        suite: 'Apt. 556',
        city: 'Gwenborough',
        zipcode: '92998-3874',
        geo: Geo(lat: '-37.3159', lng: '81.1496'),
      ),
      phone: "1-770-736-8031 x56442",
      website: "hildegard.org",
      company: Company(
        name: 'Romaguera-Crona',
        catchPhrase: 'Multi-layered client-server neural-net',
        bs: 'harness real-time e-markets',
      ),
    );
  });

  group('User', () {
    group('fromJson', () {
      test(
        'should return a valid User object',
        () {
          // ARRANGE
          const json = {
            'id': 1,
            'name': 'Leanne Graham',
            'username': 'Bret',
            'email': 'Sincere@april.biz',
            'address': {
              'street': 'Kulas Light',
              'suite': 'Apt. 556',
              'city': 'Gwenborough',
              'zipcode': '92998-3874',
              'geo': {'lat': '-37.3159', 'lng': '81.1496'}
            },
            'phone': '1-770-736-8031 x56442',
            'website': 'hildegard.org',
            'company': {
              'name': 'Romaguera-Crona',
              'catchPhrase': 'Multi-layered client-server neural-net',
              'bs': 'harness real-time e-markets',
            }
          };
          // ACT
          final newUser = User.fromJson(json);
          // ASSERT
          expect(newUser, isA<User>());
          expect(newUser, equals(user));
        },
      );
    });

    group('toJson', () {
      test(
        'should return a valid Map',
        () async {
          // ARRANGE
          final expected = {
            'id': 1,
            'name': 'Leanne Graham',
            'username': 'Bret',
            'email': 'Sincere@april.biz',
            'address': {
              'street': 'Kulas Light',
              'suite': 'Apt. 556',
              'city': 'Gwenborough',
              'zipcode': '92998-3874',
              'geo': {'lat': '-37.3159', 'lng': '81.1496'}
            },
            'phone': '1-770-736-8031 x56442',
            'website': 'hildegard.org',
            'company': {
              'name': 'Romaguera-Crona',
              'catchPhrase': 'Multi-layered client-server neural-net',
              'bs': 'harness real-time e-markets',
            }
          };
          // ACT
          final json = user.toJson();
          // ASSERT
          expect(json, isA<Map>());
          expect(json, equals(expected));
        },
      );
    });

    group('copyWith', () {
      test(
        'should return the same object if copyWith is called without parameters',
        () async {
          // ARRANGE
          final expected = user;
          // ACT
          final newUser = user.copyWith();
          // ASSERT
          expect(newUser, equals(expected));
        },
      );

      test(
        'should return correct object when only id is changed by copyWith',
        () async {
          // ARRANGE
          const expected = User(
            id: 2,
            name: "Leanne Graham",
            username: "Bret",
            email: "Sincere@april.biz",
            address: Address(
              street: 'Kulas Light',
              suite: 'Apt. 556',
              city: 'Gwenborough',
              zipcode: '92998-3874',
              geo: Geo(lat: '-37.3159', lng: '81.1496'),
            ),
            phone: "1-770-736-8031 x56442",
            website: "hildegard.org",
            company: Company(
              name: 'Romaguera-Crona',
              catchPhrase: 'Multi-layered client-server neural-net',
              bs: 'harness real-time e-markets',
            ),
          );
          // ACT
          final newUser = user.copyWith(id: 2);
          // ASSERT
          expect(newUser, equals(expected));
        },
      );

      test(
        'should return correct object when only name is changed by copyWith',
        () async {
          // ARRANGE
          const expected = User(
            id: 1,
            name: "Ervin Howell",
            username: "Bret",
            email: "Sincere@april.biz",
            address: Address(
              street: 'Kulas Light',
              suite: 'Apt. 556',
              city: 'Gwenborough',
              zipcode: '92998-3874',
              geo: Geo(lat: '-37.3159', lng: '81.1496'),
            ),
            phone: "1-770-736-8031 x56442",
            website: "hildegard.org",
            company: Company(
              name: 'Romaguera-Crona',
              catchPhrase: 'Multi-layered client-server neural-net',
              bs: 'harness real-time e-markets',
            ),
          );
          // ACT
          final newUser = user.copyWith(
            name: "Ervin Howell",
          );
          // ASSERT
          expect(newUser, equals(expected));
        },
      );

      test(
        'should return correct object when only username is changed by copyWith',
        () async {
          // ARRANGE
          const expected = User(
            id: 1,
            name: "Leanne Graham",
            username: "Antonette",
            email: "Sincere@april.biz",
            address: Address(
              street: 'Kulas Light',
              suite: 'Apt. 556',
              city: 'Gwenborough',
              zipcode: '92998-3874',
              geo: Geo(lat: '-37.3159', lng: '81.1496'),
            ),
            phone: "1-770-736-8031 x56442",
            website: "hildegard.org",
            company: Company(
              name: 'Romaguera-Crona',
              catchPhrase: 'Multi-layered client-server neural-net',
              bs: 'harness real-time e-markets',
            ),
          );
          // ACT
          final newUser = user.copyWith(
            username: "Antonette",
          );
          // ASSERT
          expect(newUser, equals(expected));
        },
      );

      test(
        'should return correct object when only email is changed by copyWith',
        () async {
          // ARRANGE
          const expected = User(
            id: 1,
            name: "Leanne Graham",
            username: "Bret",
            email: "Shanna@melissa.tv",
            address: Address(
              street: 'Kulas Light',
              suite: 'Apt. 556',
              city: 'Gwenborough',
              zipcode: '92998-3874',
              geo: Geo(lat: '-37.3159', lng: '81.1496'),
            ),
            phone: "1-770-736-8031 x56442",
            website: "hildegard.org",
            company: Company(
              name: 'Romaguera-Crona',
              catchPhrase: 'Multi-layered client-server neural-net',
              bs: 'harness real-time e-markets',
            ),
          );
          // ACT
          final newUser = user.copyWith(
            email: "Shanna@melissa.tv",
          );
          // ASSERT
          expect(newUser, equals(expected));
        },
      );

      test(
        'should return correct object when only address is changed by copyWith',
        () async {
          // ARRANGE
          const expected = User(
            id: 1,
            name: "Leanne Graham",
            username: "Bret",
            email: "Sincere@april.biz",
            address: Address(
              street: 'Victor Plains',
              suite: 'Suite 879',
              city: 'Wisokyburgh',
              zipcode: '90566-7771',
              geo: Geo(lat: '-43.9509', lng: '-34.4618'),
            ),
            phone: "1-770-736-8031 x56442",
            website: "hildegard.org",
            company: Company(
              name: 'Romaguera-Crona',
              catchPhrase: 'Multi-layered client-server neural-net',
              bs: 'harness real-time e-markets',
            ),
          );
          // ACT
          final newUser = user.copyWith(
            address: const Address(
              street: 'Victor Plains',
              suite: 'Suite 879',
              city: 'Wisokyburgh',
              zipcode: '90566-7771',
              geo: Geo(lat: '-43.9509', lng: '-34.4618'),
            ),
          );
          // ASSERT
          expect(newUser, equals(expected));
        },
      );

      test(
        'should return correct object when only phone is changed by copyWith',
        () async {
          // ARRANGE
          const expected = User(
            id: 1,
            name: "Leanne Graham",
            username: "Bret",
            email: "Sincere@april.biz",
            address: Address(
              street: 'Kulas Light',
              suite: 'Apt. 556',
              city: 'Gwenborough',
              zipcode: '92998-3874',
              geo: Geo(lat: '-37.3159', lng: '81.1496'),
            ),
            phone: "010-692-6593 x09125",
            website: "hildegard.org",
            company: Company(
              name: 'Romaguera-Crona',
              catchPhrase: 'Multi-layered client-server neural-net',
              bs: 'harness real-time e-markets',
            ),
          );
          // ACT
          final newUser = user.copyWith(
            phone: "010-692-6593 x09125",
          );
          // ASSERT
          expect(newUser, equals(expected));
        },
      );

      test(
        'should return correct object when only website is changed by copyWith',
        () async {
          // ARRANGE
          const expected = User(
            id: 1,
            name: "Leanne Graham",
            username: "Bret",
            email: "Sincere@april.biz",
            address: Address(
              street: 'Kulas Light',
              suite: 'Apt. 556',
              city: 'Gwenborough',
              zipcode: '92998-3874',
              geo: Geo(lat: '-37.3159', lng: '81.1496'),
            ),
            phone: "1-770-736-8031 x56442",
            website: "anastasia.net",
            company: Company(
              name: 'Romaguera-Crona',
              catchPhrase: 'Multi-layered client-server neural-net',
              bs: 'harness real-time e-markets',
            ),
          );
          // ACT
          final newUser = user.copyWith(
            website: "anastasia.net",
          );
          // ASSERT
          expect(newUser, equals(expected));
        },
      );

      test(
        'should return correct object when only company is changed by copyWith',
        () async {
          // ARRANGE
          const expected = User(
            id: 1,
            name: "Leanne Graham",
            username: "Bret",
            email: "Sincere@april.biz",
            address: Address(
              street: 'Kulas Light',
              suite: 'Apt. 556',
              city: 'Gwenborough',
              zipcode: '92998-3874',
              geo: Geo(lat: '-37.3159', lng: '81.1496'),
            ),
            phone: "1-770-736-8031 x56442",
            website: "hildegard.org",
            company: Company(
              name: 'Deckow-Crist',
              catchPhrase: 'Proactive didactic contingency',
              bs: 'synergize scalable supply-chains',
            ),
          );
          // ACT
          final newUser = user.copyWith(
            company: const Company(
              name: 'Deckow-Crist',
              catchPhrase: 'Proactive didactic contingency',
              bs: 'synergize scalable supply-chains',
            ),
          );
          // ASSERT
          expect(newUser, equals(expected));
        },
      );

      test(
        'should return correct object when all the parameters are changed by copyWith',
        () async {
          // ARRANGE
          const expected = User(
            id: 2,
            name: "Ervin Howell",
            username: "Antonette",
            email: "Shanna@melissa.tv",
            address: Address(
              street: 'Victor Plains',
              suite: 'Suite 879',
              city: 'Wisokyburgh',
              zipcode: '90566-7771',
              geo: Geo(lat: '-43.9509', lng: '-34.4618'),
            ),
            phone: "010-692-6593 x09125",
            website: "anastasia.net",
            company: Company(
              name: 'Deckow-Crist',
              catchPhrase: 'Proactive didactic contingency',
              bs: 'synergize scalable supply-chains',
            ),
          );
          // ACT
          final newUser = user.copyWith(
            id: 2,
            name: "Ervin Howell",
            username: "Antonette",
            email: "Shanna@melissa.tv",
            address: const Address(
              street: 'Victor Plains',
              suite: 'Suite 879',
              city: 'Wisokyburgh',
              zipcode: '90566-7771',
              geo: Geo(lat: '-43.9509', lng: '-34.4618'),
            ),
            phone: "010-692-6593 x09125",
            website: "anastasia.net",
            company: const Company(
              name: 'Deckow-Crist',
              catchPhrase: 'Proactive didactic contingency',
              bs: 'synergize scalable supply-chains',
            ),
          );
          // ASSERT
          expect(newUser, equals(expected));
        },
      );
    });
  });
}
