class ApiException implements Exception {
  final int statusCode;
  final String rawBody;

  const ApiException(this.statusCode, this.rawBody);

  @override
  String toString() => 'status code $statusCode\n$rawBody';
}
