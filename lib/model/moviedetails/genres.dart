import 'package:json_annotation/json_annotation.dart';

part 'genres.g.dart';

@JsonSerializable()
class Genres {
  @JsonKey(name: 'name')
  String genreName;


  Genres({this.genreName});

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}