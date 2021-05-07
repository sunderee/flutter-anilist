import 'dart:convert';

import 'package:c2sanilist/api/api.provider.dart';
import 'package:c2sanilist/api/models/details.model.dart';
import 'package:c2sanilist/utils/constants/graphql.const.dart';
import 'package:c2sanilist/utils/exceptions/api.exception.dart';
import 'package:c2sanilist/utils/helpers/tuple.dart';
import 'package:flutter/foundation.dart';

abstract class _IDetailsRepository {
  Future<DetailsModel?> fetchMedia(int mediaID);
}

class DetailsRepository implements _IDetailsRepository {
  static final DetailsRepository _instance = DetailsRepository._();

  DetailsRepository._();
  factory DetailsRepository.instance() => _instance;

  @override
  Future<DetailsModel?> fetchMedia(int mediaID) async =>
      compute<Pair<String, Map<String, dynamic>>, DetailsModel?>(
        _parseFetchMedia,
        Pair(FETCH_DETAILS, {'id': mediaID}),
      );
}

Future<DetailsModel?> _parseFetchMedia(
  Pair<String, Map<String, dynamic>> data,
) async {
  try {
    final rawRequest = await makeGraphQLRequest(
      data.first,
      variables: data.second,
    );
    return DetailsModel.fromJson(
      json.decode(rawRequest)['data']['Media'] as Map<String, dynamic>,
    );
  } on ApiException catch (e) {
    print(e.toString());
  }
}
