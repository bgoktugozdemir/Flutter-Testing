echo "\033[0;33m##### Old coverage is removing... #####\033[0m"
rm -rf coverage
echo "Old coverage is removed."

echo "\033[0;33m##### Tests are running and the test coverage is generating... #####\033[0m"
flutter test --update-goldens --coverage

echo "\033[0;33m##### Generated files is dismissing... #####\033[0m"
lcov --remove coverage/lcov.info 'lib/*/*.freezed.dart' 'lib/*/.g.dart' 'lib/*/*.part.dart' 'lib/generated/*.dart' 'lib/*/*/.dart' -o coverage/lcov.info

echo "\033[0;33m##### Test coverage badge is generating... #####\033[0m"
flutter pub run test_coverage_badge
echo "Test coverage badge is generated."

echo "\033[0;33m##### Test coverage HTML file is generating... #####\033[0m"
genhtml -o coverage coverage/lcov.info

echo "\033[0;33m##### Test coverage HTML page is opening... #####\033[0m"
open coverage/index.html
echo "Test coverage page is opened."

echo "\033[0;33m##### Integration tests are running... #####\033[0m"
# flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
flutter test integration_test