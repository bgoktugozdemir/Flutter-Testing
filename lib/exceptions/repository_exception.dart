class RepositoryException implements Exception {
  final dynamic message;

  const RepositoryException([this.message]);
}

class RepositoryStatusCodeException extends RepositoryException {
  const RepositoryStatusCodeException(this.statusCode, [dynamic message])
      : super(message);

  final int statusCode;
}
