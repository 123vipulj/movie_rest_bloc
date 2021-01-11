// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actor _$ActorFromJson(Map<String, dynamic> json) {
  return Actor(
    page: json['page'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : ActorDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
