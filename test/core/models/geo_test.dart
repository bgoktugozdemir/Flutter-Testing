import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';

void main() {
  late Geo geo;

  setUpAll(() {
    geo = const Geo(lat: '-37.3159', lng: '81.1496');
  });

  group('Geo', () {
    group('empty', () {
      test(
        'should return an empty Geo object',
        () {
          // ARRANGE
          const expected = Geo(lat: '', lng: '');
          // ACT
          const geo = Geo.empty();
          // ASSERT
          expect(geo, equals(expected));
        },
      );
    });

    group('fromJson', () {
      test(
        'should return a valid Geo object',
        () {
          // ARRANGE
          const json = {
            'lat': '-37.3159',
            'lng': '81.1496',
          };
          // ACT
          final newGeo = Geo.fromJson(json);
          // ASSERT
          expect(newGeo, isA<Geo>());
          expect(newGeo, equals(geo));
        },
      );
    });

    group('toJson', () {
      test(
        'should return a valid Map',
        () {
          // ARRANGE
          final expected = {
            'lat': '-37.3159',
            'lng': '81.1496',
          };
          // ACT
          final json = geo.toJson();
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
          final expected = geo;
          // ACT
          final newGeo = geo.copyWith();
          // ASSERT
          expect(newGeo, equals(expected));
        },
      );

      test(
        'should return correct object when only lat is changed by copyWith',
        () {
          // ARRANGE
          const expected = Geo(lat: '-37', lng: '81.1496');
          // ACT
          final newGeo = geo.copyWith(lat: '-37');
          // ASSERT
          expect(newGeo, equals(expected));
        },
      );

      test(
        'should return correct object when only lng is changed by copyWith',
        () {
          // ARRANGE
          const expected = Geo(lat: '-37.3159', lng: '81');
          // ACT
          final newGeo = geo.copyWith(lng: '81');
          // ASSERT
          expect(newGeo, equals(expected));
        },
      );

      test(
        'should return correct object when all the parameters are changed by copyWith',
        () {
          // ARRANGE
          const expected = Geo(lat: '-37', lng: '81');
          // ACT
          final newGeo = geo.copyWith(lat: '-37', lng: '81');
          // ASSERT
          expect(newGeo, equals(expected));
        },
      );
    });
  });
}
