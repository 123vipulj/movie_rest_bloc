// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return SearchResult(
    posterPath: json['poster_path'] as String,
    movieTitle: json['title'] as String,
    releaseDate: json['release_date'] as String,
  );
}

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'title': instance.movieTitle,
      'release_date': instance.releaseDate,
    };
