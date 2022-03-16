import 'package:flutter/material.dart';

@immutable
class SummaryModel {
  final int id;
  final String title;
  final String description;
  final String mediaURL;

  const SummaryModel._({
    required this.id,
    required this.title,
    required this.description,
    required this.mediaURL,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) => SummaryModel._(
        id: json['id'] as int,
        title: json['title']['english'] as String? ??
            json['title']['romaji'] as String,
        description: ((json['description'] as String).split(' ')).length < 20
            ? json['description'] as String
            : (json['description'] as String)
                    .split(' ')
                    .sublist(0, 20)
                    .join(' ')
                    .replaceAll(RegExp(r'<[^>]*>'), '') +
                '...',
        mediaURL: json['coverImage']['large'] as String,
      );
}
