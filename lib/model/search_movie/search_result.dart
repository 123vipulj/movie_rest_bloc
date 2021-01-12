import 'package:json_annotation/json_annotation.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult{
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'title')
  String movieTitle;
  @JsonKey(name: 'release_date')
  String releaseDate;

  SearchResult({this.posterPath, this.movieTitle, this.releaseDate});

  factory SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}