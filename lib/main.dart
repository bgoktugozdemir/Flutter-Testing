import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/app.dart';

void main() {
  // Handles Flutter Errors
  FlutterError.onError = (details) {
    if (kDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      final error = details.exception;
      final stackTrace = details.stack ?? StackTrace.empty;
      Zone.current.handleUncaughtError(error, stackTrace);
    }
  };

  // Handles Dart Errors
  runZonedGuarded<void>(
    () {
      runApp(const MyApp());
    },
    (error, stackTrace) {
      print('Caught Dart Error');

      if (kDebugMode) {
        // In development, print [error] and [stackTrace].
        print(error);
        print(stackTrace);
      } else {
        /// In production, report to an error tracking system.

      }
    },
    zoneSpecification: const ZoneSpecification(),
    zoneValues: {},
  );
}
