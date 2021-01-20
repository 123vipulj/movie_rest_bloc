// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) {
  return MovieDetail(
    backdropPath: json['backdrop_path'] as String,
    budget: json['budget'] as int,
    genres: (json['genres'] as List)
        ?.map((e) =>
            e == null ? null : Genres.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    imdbId: json['imdb_id'] as String,
    originalLanguage: json['original_language'] as String,
    title: json['original_title'] as String,
    overView: json['overview'] as String,
    posterPath: json['poster_path'] as String,
    releaseDate: json['release_date'] as String,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    tagLine: json['tagline'] as String,
  );
}

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'budget': instance.budget,
      'genres': instance.genres,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.title,
      'overview': instance.overView,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'tagline': instance.tagLine,
    };
