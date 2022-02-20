echo "\033[0;33mFlutter is cleaning...\033[0m"
flutter clean
echo "\033[0;33mFlutter packages are getting...\033[0m"
flutter pub get
echo "\033[0;33mOld coverage is removing...\033[0m"
rm -rf coverage
echo "\033[0;33mTest coverage is generating...\033[0m"
flutter test --coverage
echo "\033[0;33mTest coverage badge is generating...\033[0m"
flutter pub run test_coverage_badge
echo "\033[0;33mTest coverage HTML file is generating...\033[0m"
genhtml -o coverage coverage/lcov.info
echo "\033[0;33mTest coverage HTML page is opening...\033[0m"
open coverage/index.html