import 'package:c2sanilist/api/repositories/summary.repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('testing summary repository', () {
    test('should retrieve 50 elements from homepage', () async {
      final repository = SummaryRepository.instance();
      final results = await repository.fetchSummary(1, 50);
      expect(results.length, 50);
    });
  });
}
