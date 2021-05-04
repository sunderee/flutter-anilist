import 'dart:convert';
import 'dart:io';

import 'package:c2sanilist/utils/exceptions/api.exception.dart';
import 'package:c2sanilist/utils/helpers/format_query.helper.dart';
import 'package:c2sanilist/utils/helpers/tuple.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

final Uri _baseUri = Uri.parse('https://graphql.anilist.co');

Future<String> makeGraphQLRequest(
  String query, {
  Map<String, dynamic>? variables,
}) async {
  return compute<Pair<String, Map<String, dynamic>>, String>(
    _parseGraphQLRequest,
    Pair(query, variables ?? {}),
  );
}

Future<String> _parseGraphQLRequest(
  Pair<String, Map<String, dynamic>> input,
) async {
  final request = await post(
    _baseUri,
    headers: {'Content-Type': 'application/json'},
    body: json.encode(
      {
        'query': formatQuery(input.first),
        'variables': input.second,
      },
    ),
  );

  if (request.statusCode != 200) {
    throw ApiException(request.statusCode, request.body);
  }
  return request.body;
}
