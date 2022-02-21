import 'dart:developer';

enum RequestMethod { get, post, put, patch, delete }

class RestLogger {
  const RestLogger(this.method);

  final RequestMethod method;

  void request(Uri uri) => log(
        '$_method $uri',
        name: 'REST API',
        time: DateTime.now(),
      );

  void status(Uri uri, int statusCode) => log(
        '$_method $uri $statusCode',
        name: 'REST API',
        time: DateTime.now(),
      );

  void error(
    Uri uri,
    Object error,
    StackTrace stackTrace,
  ) =>
      log(
        '$_method $uri',
        name: 'REST API ERROR',
        time: DateTime.now(),
        error: error,
        stackTrace: stackTrace,
      );

  String get _method => method.toString().split('.').last.toUpperCase();
}
