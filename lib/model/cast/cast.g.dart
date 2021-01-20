// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) {
  return Cast(
    actorName: json['name'] as String,
    actorImgPath: json['profile_path'] as String,
    chracter: json['character'] as String,
  );
}

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'name': instance.actorName,
      'profile_path': instance.actorImgPath,
      'character': instance.chracter,
    };
