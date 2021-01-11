
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_rest_bloc/model/popularmovie/result.dart';

part 'nowpresult.g.dart';

@JsonSerializable()
class NowPResult {
  double popularity;
  @JsonKey(name: 'backdrop_path')
  String backDropPath;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'overview')
  String movieOverview;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;

  NowPResult({this.popularity,
    this.backDropPath,
    this.originalTitle,
    this.movieOverview,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount});

  factory NowPResult.fromJson(Map<String, dynamic> json) => _$NowPResultFromJson(json);

  Map<String, dynamic> toJson() => _$NowPResultToJson(this);
}