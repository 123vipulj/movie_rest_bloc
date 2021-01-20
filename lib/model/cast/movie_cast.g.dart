// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCast _$MovieCastFromJson(Map<String, dynamic> json) {
  return MovieCast(
    id: json['id'] as int,
    cast: (json['cast'] as List)
        ?.map(
            (e) => e == null ? null : Cast.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieCastToJson(MovieCast instance) => <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
    };
