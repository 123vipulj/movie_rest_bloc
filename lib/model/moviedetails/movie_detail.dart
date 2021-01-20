import 'package:json_annotation/json_annotation.dart';
import 'package:movie_rest_bloc/model/moviedetails/genres.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetail {
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  @JsonKey(name: 'budget')
  int budget;
  List<Genres> genres;
  @JsonKey(name: 'imdb_id')
  String imdbId;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String title;
  @JsonKey(name: 'overview')
  String overView;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'tagline')
  String tagLine;

  MovieDetail({
      this.backdropPath,
      this.budget,
      this.genres,
      this.imdbId,
      this.originalLanguage,
      this.title,
      this.overView,
      this.posterPath,
      this.releaseDate,
      this.voteAverage,
      this.tagLine});

  factory MovieDetail.fromJson(Map<String, dynamic> json) => _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}