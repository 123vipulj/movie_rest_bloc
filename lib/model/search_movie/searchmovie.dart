import 'package:json_annotation/json_annotation.dart';
import 'package:movie_rest_bloc/model/search_movie/search_result.dart';

part 'searchmovie.g.dart';

@JsonSerializable()
class SearchMovie {
  int page;
  List<SearchResult> results;


  SearchMovie({this.page, this.results});

  factory SearchMovie.fromJson(Map<String, dynamic> json) => _$SearchMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMovieToJson(this);
}