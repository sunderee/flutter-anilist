import 'package:freezed_annotation/freezed_annotation.dart';

part 'graphql_request.model.freezed.dart';
part 'graphql_request.model.g.dart';

@freezed
@immutable
class GraphQLRequestModel with _$GraphQLRequestModel {
  const factory GraphQLRequestModel({
    @JsonKey(name: 'query') required String query,
    @JsonKey(name: 'variables', includeIfNull: false)
        Map<String, dynamic>? variables,
  }) = _GraphQLRequestModel;

  factory GraphQLRequestModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GraphQLRequestModelFromJson(json);
}
