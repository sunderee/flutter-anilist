class ApiException implements Exception {
  final int statusCode;
  final String? reason;

  const ApiException({
    required this.statusCode,
    this.reason,
  });

  @override
  String toString() => '$runtimeType $statusCode: $reason';
}
