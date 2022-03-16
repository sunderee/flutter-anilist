import 'package:c2sanilist/api/repositories/details.repository.dart';
import 'package:c2sanilist/api/repositories/summary.repository.dart';
import 'package:c2sanilist/config/dependencies.config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeDependencies();

  group('testing repositories', () {
    test('should retrieve 50 elements from homepage', () async {
      final repository = SummaryRepository();
      final results = await repository.fetchSummary(1, 30);
      expect(results.length, 30);
    });

    test('should retrieve details', () async {
      final repository = DetailsRepository();
      final details = await repository.fetchMedia(1986);
      expect(details.type != null, true);
    });
  });
}
