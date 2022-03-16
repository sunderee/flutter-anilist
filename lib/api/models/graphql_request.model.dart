class GraphQLRequestModel {
  final String query;
  final Map<String, dynamic>? variables;

  GraphQLRequestModel({
    required this.query,
    this.variables,
  });

  Map<String, dynamic> toJson() => {'query': query, 'variables': variables};
}
