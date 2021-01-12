// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchmovie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMovie _$SearchMovieFromJson(Map<String, dynamic> json) {
  return SearchMovie(
    page: json['page'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : SearchResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchMovieToJson(SearchMovie instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
