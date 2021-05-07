import 'dart:convert';

import 'package:c2sanilist/utils/exceptions/api.exception.dart';
import 'package:c2sanilist/utils/helpers/format_query.helper.dart';
import 'package:http/http.dart';

final Uri _baseUri = Uri.parse('https://graphql.anilist.co');

Future<String> makeGraphQLRequest(
  String query, {
  Map<String, dynamic>? variables,
}) async {
  final request = await post(
    _baseUri,
    headers: {'Content-Type': 'application/json'},
    body: json.encode(
      {
        'query': formatQuery(query),
        'variables': variables ?? {},
      },
    ),
  );

  if (request.statusCode != 200) {
    throw ApiException(request.statusCode, request.body);
  }
  return request.body;
}
