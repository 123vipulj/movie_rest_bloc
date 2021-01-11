// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_known_for.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorKnownFor _$ActorKnownForFromJson(Map<String, dynamic> json) {
  return ActorKnownFor(
    originalTitle: json['original_title'] as String,
    movieOverview: json['overview'] as String,
    posterPath: json['poster_path'] as String,
    releaseDate: json['release_date'] as String,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    voteCount: json['vote_count'] as int,
    language: json['original_language'] as String,
  );
}

Map<String, dynamic> _$ActorKnownForToJson(ActorKnownFor instance) =>
    <String, dynamic>{
      'original_title': instance.originalTitle,
      'overview': instance.movieOverview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'original_language': instance.language,
    };
