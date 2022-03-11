echo "\033[0;33m##### Generating APK for Android Robo Test... #####\033[0m"
pushd android
flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=integration_test/app_test.dart
popd
