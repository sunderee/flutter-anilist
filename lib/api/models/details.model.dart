import 'package:c2sanilist/utils/helpers/tuple.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class DetailsModel extends Equatable {
  final Pair<String, String?> title;
  final String description;
  final String mediaURL;
  final List<String> genres;
  final String? type;
  final String? format;
  final int? episodes;
  final int? duration;

  DetailsModel._({
    required this.title,
    required this.description,
    required this.mediaURL,
    required this.genres,
    required this.type,
    required this.format,
    required this.episodes,
    required this.duration,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel._(
        title: Pair(json['title']['romaji'], json['title']['english']),
        description: (json['description'] as String).replaceAll(r'<[^>]*>', ''),
        mediaURL: json['coverImage']['large'],
        genres: (json['genres'] as List<dynamic>).cast<String>(),
        type: json['type'],
        format: json['format'],
        episodes: json['episodes'],
        duration: json['duration'],
      );

  @override
  List<Object?> get props => [
        title,
        description,
        mediaURL,
        genres,
        type,
        format,
        episodes,
        duration,
      ];
}
