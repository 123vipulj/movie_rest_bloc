// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nowplaying.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowPlaying _$NowPlayingFromJson(Map<String, dynamic> json) {
  return NowPlaying(
    page: json['page'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : NowPResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NowPlayingToJson(NowPlaying instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
