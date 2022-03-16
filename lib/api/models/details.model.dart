import 'package:c2sanilist/utils/helpers/tuple.dart';
import 'package:meta/meta.dart';

@immutable
class DetailsModel {
  final Pair<String, String?> title;
  final String description;
  final String mediaURL;
  final List<String> genres;
  final String? type;
  final String? format;
  final int? episodes;
  final int? duration;

  const DetailsModel._({
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
        title: Pair(
          json['title']['romaji'] as String,
          json['title']['english'] as String,
        ),
        description: (json['description'] as String).replaceAll(r'<[^>]*>', ''),
        mediaURL: json['coverImage']['large'] as String,
        genres: (json['genres'] as List<dynamic>).cast<String>(),
        type: json['type'] as String?,
        format: json['format'] as String?,
        episodes: json['episodes'] as int?,
        duration: json['duration'] as int?,
      );
}
