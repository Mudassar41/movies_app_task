import 'package:json_annotation/json_annotation.dart';
import 'package:task/models/movie.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse {
  @JsonKey(name: "page")
  int page;
  @JsonKey(name: "results")
  List<Movie> movies;
  @JsonKey(name: "total_pages")
  int totalPages;
  @JsonKey(name: "total_results")
  int totalResults;

  MoviesResponse({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

}
