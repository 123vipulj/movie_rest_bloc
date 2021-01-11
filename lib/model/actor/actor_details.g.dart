// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorDetails _$ActorDetailsFromJson(Map<String, dynamic> json) {
  return ActorDetails(
    actorName: json['name'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    profilePicUrl: json['profile_path'] as String,
    known_for: (json['known_for'] as List)
        ?.map((e) => e == null
            ? null
            : ActorKnownFor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ActorDetailsToJson(ActorDetails instance) =>
    <String, dynamic>{
      'name': instance.actorName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePicUrl,
      'known_for': instance.known_for,
    };
