import 'dart:convert';
import 'dart:io';

import 'package:c2sanilist/api/models/graphql_request.model.dart';
import 'package:c2sanilist/utils/exceptions/api.exception.dart';
import 'package:http/http.dart';

class ApiProvider {
  static final Uri _baseUri = Uri.parse('https://graphql.anilist.co');

  Future<String> makeGraphQLRequest({
    required GraphQLRequestModel request,
  }) async {
    final response = await post(
      _baseUri,
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.toString()},
      body: json.encode(request.toJson()),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ApiException(
        statusCode: response.statusCode,
        reason: response.reasonPhrase,
      );
    }
    return response.body;
  }
}
