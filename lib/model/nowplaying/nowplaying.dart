import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_rest_bloc/model/popularmovie/result.dart';

import 'nowpresult.dart';

part 'nowplaying.g.dart';

@JsonSerializable()
class NowPlaying{
  int page;
  List<NowPResult> results;

  NowPlaying({this.page, this.results});

  factory NowPlaying.fromJson(Map<String, dynamic> json) => _$NowPlayingFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingToJson(this);
}

