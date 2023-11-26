import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';


/// This class is annotated with Hive and JsonSerializable for Hive database integration
/// and JSON serialization

@HiveType(typeId: 1)
@JsonSerializable()
class Movie extends HiveObject {
  @HiveField(1)
  @JsonKey(name: "adult")
  bool adult;
  @HiveField(2)
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @HiveField(3)
  @JsonKey(name: "genre_ids")
  List<int> genreIds;
  @HiveField(4)
  @JsonKey(name: "id")
  int id;
  @HiveField(5)
  @JsonKey(name: "original_language")
  String originalLanguage;
  @HiveField(6)
  @JsonKey(name: "original_title")
  String originalTitle;
  @HiveField(7)
  @JsonKey(name: "overview")
  String overview;
  @HiveField(8)
  @JsonKey(name: "popularity")
  double popularity;
  @HiveField(9)
  @JsonKey(name: "poster_path")
  String posterPath;
  @HiveField(10)
  @JsonKey(name: "release_date")
  DateTime releaseDate;
  @HiveField(11)
  @JsonKey(name: "title")
  String title;
  @HiveField(12)
  @JsonKey(name: "video")
  bool video;
  @HiveField(13)
  @JsonKey(name: "vote_average")
  double voteAverage;
  @HiveField(14)
  @JsonKey(name: "vote_count")
  int voteCount;

  Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
