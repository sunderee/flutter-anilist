import 'package:c2sanilist/api/repositories/details.repository.dart';
import 'package:c2sanilist/api/repositories/summary.repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('testing repositories', () {
    test('should retrieve 50 elements from homepage', () async {
      final repository = SummaryRepository.instance();
      final results = await repository.fetchSummary(1, 30);
      expect(results.length, 30);
    });

    test('should retrieve details', () async {
      final repository = DetailsRepository.instance();
      final details = await repository.fetchMedia(1986);
      expect(details != null, true);
    });
  });
}
