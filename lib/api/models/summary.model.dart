import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SummaryModel extends Equatable {
  final int id;
  final String title;
  final String mediaURL;

  SummaryModel._({
    required this.id,
    required this.title,
    required this.mediaURL,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) => SummaryModel._(
        id: json['id'],
        title: json['title']['english'] ?? json['title']['romaji'],
        mediaURL: json['coverImage']['large'],
      );

  @override
  List<Object?> get props => [
        id,
        title,
        mediaURL,
      ];
}
