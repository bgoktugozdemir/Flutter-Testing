import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/core/repositories/repositories.dart';
import 'package:flutter_testing/user_detail/user_detail.dart';
import 'package:flutter_testing/users/view/users_page.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_testing/main_test.dart' as app;
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> _test(
    WidgetTester tester, {
    UserRepository? userRepository,
  }) async {
    app.main(userRepository: userRepository);
    await tester.pump();

    expect(find.byType(UsersPage), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    final firstUser = find.byType(ListTile).first;

    expect(firstUser, findsOneWidget);

    await tester.tap(firstUser);

    await tester.pumpAndSettle();

    expect(find.byType(UserDetailPage), findsOneWidget);
    expect(find.byType(UsersPage), findsNothing);

    final backButton = find.byTooltip('Back');

    await tester.tap(backButton);

    await tester.pumpAndSettle();

    expect(find.byType(UsersPage), findsOneWidget);
    expect(find.byType(UserDetailPage), findsNothing);
  }

  group('Mock Data', () {
    const users = <User>[
      User(
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
      ),
      User(
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
      )
    ];

    late UserRepository userRepository;

    setUpAll(() {
      userRepository = MockUserRepository();
    });
    testWidgets(
      'Loading -> Users -> Press First User -> Navigate to the User Detail Page -> Loading -> User Detail -> Press Back Button -> Navigate to the Users Page',
      (tester) async {
        when(() => userRepository.getUsers()).thenAnswer((_) async => users);
        when(() => userRepository.getUser(any()))
            .thenAnswer((_) async => users.first);

        await _test(tester, userRepository: userRepository);
      },
    );
  });

  group('Real Data', () {
    testWidgets(
      'Loading -> Users -> Press First User -> Navigate to the User Detail Page -> Loading -> User Detail -> Press Back Button -> Navigate to the Users Page',
      (tester) async {
        await _test(tester);
      },
    );
  });
}
