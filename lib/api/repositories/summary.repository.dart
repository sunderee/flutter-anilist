import 'dart:convert';

import 'package:c2sanilist/api/api.provider.dart';
import 'package:c2sanilist/api/models/graphql_request.model.dart';
import 'package:c2sanilist/api/models/summary.model.dart';
import 'package:c2sanilist/config/dependencies.config.dart';
import 'package:c2sanilist/utils/constants/graphql.const.dart';
import 'package:c2sanilist/utils/helpers/tuple.dart';
import 'package:flutter/foundation.dart';

typedef FetchSummaryInputType = Pair<ApiProvider, GraphQLRequestModel>;

abstract class ISummaryRepository {
  Future<List<SummaryModel>> fetchSummary(int page, int perPage);
}

class SummaryRepository implements ISummaryRepository {
  final ApiProvider _apiProvider;

  SummaryRepository() : _apiProvider = getIt.get<ApiProvider>();

  @override
  Future<List<SummaryModel>> fetchSummary(int page, int perPage) async =>
      compute<FetchSummaryInputType, List<SummaryModel>>(
        _parseFetchSummary,
        Pair(
          _apiProvider,
          GraphQLRequestModel(
            query: fetchHomepageQuery,
            variables: {'page': page, 'perPage': perPage},
          ),
        ),
      );
}

Future<List<SummaryModel>> _parseFetchSummary(
  FetchSummaryInputType input,
) async {
  final rawResponse = await input.first.makeGraphQLRequest(
    request: input.second,
  );
  final response = json.decode(rawResponse) as Map<String, dynamic>;

  return (response['data']['Page']['media'] as List<dynamic>)
      .cast<Map<String, dynamic>>()
      .where((element) =>
          element['coverImage']['large'] != null &&
          element['description'] != null)
      .map((element) => SummaryModel.fromJson(element))
      .toList();
}
