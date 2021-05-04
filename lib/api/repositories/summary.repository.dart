import 'dart:convert';

import 'package:c2sanilist/api/api.provider.dart';
import 'package:c2sanilist/api/models/summary.model.dart';
import 'package:c2sanilist/utils/constants/graphql.const.dart';
import 'package:c2sanilist/utils/exceptions/api.exception.dart';
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
    final rawRequest = await makeGraphQLRequest(
      FETCH_HOMEPAGE,
      variables: {'page': page, 'perPage': perPage},
    );
    return compute<String, List<SummaryModel>>(
      _parseFetchSummary,
      rawRequest,
    );
  }
}

Future<List<SummaryModel>> _parseFetchSummary(String rawRequest) async {
  try {
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
