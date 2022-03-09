import 'dart:async';

import 'package:golden_toolkit/golden_toolkit.dart';

import 'golden/config.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      return testMain();
    },
    config: GoldenToolkitConfiguration(
      defaultDevices: Devices.allTestDevices,
      enableRealShadows: true,
    ),
  );
}
