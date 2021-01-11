// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nowpresult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowPResult _$NowPResultFromJson(Map<String, dynamic> json) {
  return NowPResult(
    popularity: (json['popularity'] as num)?.toDouble(),
    backDropPath: json['backdrop_path'] as String,
    originalTitle: json['original_title'] as String,
    movieOverview: json['overview'] as String,
    posterPath: json['poster_path'] as String,
    releaseDate: json['release_date'] as String,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    voteCount: json['vote_count'] as int,
  );
}

Map<String, dynamic> _$NowPResultToJson(NowPResult instance) =>
    <String, dynamic>{
      'popularity': instance.popularity,
      'backdrop_path': instance.backDropPath,
      'original_title': instance.originalTitle,
      'overview': instance.movieOverview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
