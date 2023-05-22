import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/user_detail/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../user_detail_robot.dart';

class MockOnTap extends Mock {
  void call();
}

void main() {
  group('UserDetailLoaded', () {
    const user = User(
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

    testWidgets('renders correct user details', (tester) async {
      final robot = UserDetailRobot(tester);
      final key = UniqueKey();

      await robot.pumpLoadedWidget(key: key, user: user);

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(Bio), findsOneWidget);
    });

    group('Bio', () {
      testWidgets(
        "renders correct widgets",
        (WidgetTester tester) async {
          final robot = UserDetailRobot(tester);

          await robot.pumpApp(
            body: const Bio(user: user),
          );
          expect(
            find.widgetWithText(CircleAvatar, '${user.id}'),
            findsOneWidget,
          );

          expect(
            find.widgetWithText(BioInfo, user.name),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(BioInfo, '@${user.username}'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(BioInfo, user.email),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(BioInfo, user.phone),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(BioInfo, user.website),
            findsOneWidget,
          );

          expect(find.byType(Column), findsOneWidget);
          expect(find.byType(SizedBox), findsNWidgets(3));
        },
      );

      testWidgets('runs onTap method when it is called', (tester) async {
        final robot = UserDetailRobot(tester);
        final onTap = MockOnTap();

        await robot.pumpApp(
          body: BioInfo(info: 'Test', onTap: onTap),
        );

        final bioInfo = find.byType(BioInfo);

        expect(bioInfo, findsOneWidget);

        await tester.tap(bioInfo);

        verify(onTap).called(1);
      });
    });

    group('AddressSection', () {
      testWidgets(
        "renders correct widgets",
        (WidgetTester tester) async {
          final robot = UserDetailRobot(tester);

          await robot.pumpApp(
            body: AddressSection(address: user.address),
          );

          expect(find.widgetWithText(SectionHeader, 'Address'), findsOneWidget);

          expect(
            find.widgetWithText(UserInfoBar, user.address.fullAddress),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(UserInfoBar, user.address.geo.coordinates),
            findsOneWidget,
          );
        },
      );
    });

    group('CompanySection', () {
      testWidgets(
        "renders correct widgets",
        (WidgetTester tester) async {
          final robot = UserDetailRobot(tester);

          await robot.pumpApp(
            body: CompanySection(company: user.company),
          );

          expect(find.widgetWithText(SectionHeader, 'Company'), findsOneWidget);

          expect(
            find.widgetWithText(UserInfoBar, user.company.name),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(UserInfoBar, user.company.catchPhrase),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(UserInfoBar, user.company.bs),
            findsOneWidget,
          );
        },
      );
    });
  });
}
