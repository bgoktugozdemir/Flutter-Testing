import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';

void main() {
  late Company company;

  setUpAll(() {
    company = const Company(
      name: 'Romaguera-Crona',
      catchPhrase: 'Multi-layered client-server neural-net',
      bs: 'harness real-time e-markets',
    );
  });

  group('Company', () {
    group('empty', () {
      test(
        'should return an empty Company object',
        () {
          // ARRANGE
          const expected = Company(name: '', catchPhrase: '', bs: '');
          // ACT
          const company = Company.empty();
          // ASSERT
          expect(company, equals(expected));
        },
      );
    });

    group('fromJson', () {
      test(
        'should return a valid Company object',
        () {
          // ARRANGE
          const json = {
            'name': 'Romaguera-Crona',
            'catchPhrase': 'Multi-layered client-server neural-net',
            'bs': 'harness real-time e-markets',
          };
          // ACT
          final newCompany = Company.fromJson(json);
          // ASSERT
          expect(newCompany, isA<Company>());
          expect(newCompany, equals(company));
        },
      );
    });

    group('toJson', () {
      test(
        'should return a valid Map',
        () {
          // ARRANGE
          final expected = {
            'name': 'Romaguera-Crona',
            'catchPhrase': 'Multi-layered client-server neural-net',
            'bs': 'harness real-time e-markets',
          };
          // ACT
          final json = company.toJson();
          // ASSERT
          expect(json, isA<Map>());
          expect(json, equals(expected));
        },
      );
    });

    group('copyWith', () {
      test(
        'should return the same object if copyWith is called without parameters',
        () {
          // ARRANGE
          final expected = company;
          // ACT
          final newCompany = company.copyWith();
          // ASSERT
          expect(newCompany, equals(expected));
        },
      );

      test(
        'should return correct object when only name is changed by copyWith',
        () {
          // ARRANGE
          const expected = Company(
            name: 'Deckow-Crist',
            catchPhrase: 'Multi-layered client-server neural-net',
            bs: 'harness real-time e-markets',
          );
          // ACT
          final newCompany = company.copyWith(name: 'Deckow-Crist');
          // ASSERT
          expect(newCompany, equals(expected));
        },
      );
      test(
        'should return correct object when only catchPhrase is changed by copyWith',
        () {
          // ARRANGE
          const expected = Company(
            name: 'Romaguera-Crona',
            catchPhrase: 'Proactive didactic contingency',
            bs: 'harness real-time e-markets',
          );
          // ACT
          final newCompany =
              company.copyWith(catchPhrase: 'Proactive didactic contingency');
          // ASSERT
          expect(newCompany, equals(expected));
        },
      );
      test(
        'should return correct object when only bs is changed by copyWith',
        () {
          // ARRANGE
          const expected = Company(
            name: 'Romaguera-Crona',
            catchPhrase: 'Multi-layered client-server neural-net',
            bs: 'synergize scalable supply-chains',
          );
          // ACT
          final newCompany =
              company.copyWith(bs: 'synergize scalable supply-chains');
          // ASSERT
          expect(newCompany, equals(expected));
        },
      );

      test(
        'should return correct object when all the parameters are changed by copyWith',
        () {
          // ARRANGE
          const expected = Company(
            name: 'Deckow-Crist',
            catchPhrase: 'Proactive didactic contingency',
            bs: 'synergize scalable supply-chains',
          );
          // ACT
          final newCompany = company.copyWith(
            name: 'Deckow-Crist',
            catchPhrase: 'Proactive didactic contingency',
            bs: 'synergize scalable supply-chains',
          );
          // ASSERT
          expect(newCompany, equals(expected));
        },
      );
    });
  });
}
