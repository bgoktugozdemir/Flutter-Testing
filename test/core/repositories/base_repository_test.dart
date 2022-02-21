import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/repositories/base_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockBaseRepository extends Mock implements BaseRepository {}

void main() {
  late final MockBaseRepository mockBaseRepository;

  setUpAll(() {
    mockBaseRepository = MockBaseRepository();
  });

  tearDownAll(() {
    mockBaseRepository.close();
  });

  group('BaseRepository', () {
    group('get', () {
      test(
        '',
        () async {
          // ARRANGE

          // ACT

          // ASSERT
        },
      );
    });
  });
}
