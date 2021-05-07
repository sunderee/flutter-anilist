import 'dart:convert';

import 'package:c2sanilist/api/api.provider.dart';
import 'package:c2sanilist/api/models/summary.model.dart';
import 'package:c2sanilist/utils/constants/graphql.const.dart';
import 'package:c2sanilist/utils/exceptions/api.exception.dart';
import 'package:c2sanilist/utils/helpers/tuple.dart';
import 'package:flutter/foundation.dart';

abstract class _ISummaryRepository {
  Future<List<SummaryModel>> fetchSummary(int page, int perPage);
}

class SummaryRepository implements _ISummaryRepository {
  static final SummaryRepository _instance = SummaryRepository._();

  SummaryRepository._();
  factory SummaryRepository.instance() => _instance;

  @override
  Future<List<SummaryModel>> fetchSummary(int page, int perPage) async {
    return compute<Pair<String, Map<String, dynamic>>, List<SummaryModel>>(
      _parseFetchSummary,
      Pair(FETCH_HOMEPAGE, {'page': page, 'perPage': perPage}),
    );
  }
}

Future<List<SummaryModel>> _parseFetchSummary(
  Pair<String, Map<String, dynamic>> data,
) async {
  try {
    final rawRequest = await makeGraphQLRequest(
      data.first,
      variables: data.second,
    );

    final request = json.decode(rawRequest) as Map<String, dynamic>;
    final summaries = (request['data']['Page']['media'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .where((element) =>
            element['coverImage']['large'] != null &&
            element['description'] != null)
        .map((element) => SummaryModel.fromJson(element))
        .toList();
    return summaries;
  } on ApiException catch (e) {
    print(e.toString());
    return <SummaryModel>[];
  }
}
