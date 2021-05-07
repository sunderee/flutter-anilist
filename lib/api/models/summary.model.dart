import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SummaryModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final String mediaURL;

  SummaryModel._({
    required this.id,
    required this.title,
    required this.description,
    required this.mediaURL,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel._(
      id: json['id'],
      title: json['title']['english'] ?? json['title']['romaji'],
      description: ((json['description'] as String).split(' ')).length < 20
          ? json['description']
          : (json['description'] as String)
                  .split(' ')
                  .sublist(0, 20)
                  .join(' ')
                  .replaceAll(r'<[^>]*>', '') +
              '...',
      mediaURL: json['coverImage']['large'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        mediaURL,
      ];
}
