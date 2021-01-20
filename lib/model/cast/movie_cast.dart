import 'package:json_annotation/json_annotation.dart';

import 'cast.dart';
part 'movie_cast.g.dart';

@JsonSerializable()
class MovieCast{
  int id;
  List<Cast> cast;

  MovieCast({this.id, this.cast});

  factory MovieCast.fromJson(Map<String, dynamic> json) => _$MovieCastFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCastToJson(this);
}