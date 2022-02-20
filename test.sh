echo "Flutter is cleaning..."
flutter clean
echo "Flutter packages are getting..."
flutter pub get
echo "Old coverage is removing..."
rm -rf coverage
echo "Test coverage is generating..."
flutter test --coverage
echo "Test coverage badge is generating..."
flutter pub run test_coverage_badge
echo "Test coverage HTML file is generating..."
genhtml -o coverage coverage/lcov.info
echo "Test coverage HTML page is opening..."
open coverage/index.html