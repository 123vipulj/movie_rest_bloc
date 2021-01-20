import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast{
  @JsonKey(name : 'name')
  String actorName;
  @JsonKey(name : 'profile_path')
  String actorImgPath;
  @JsonKey(name : 'character')
  String chracter;

  Cast({this.actorName, this.actorImgPath, this.chracter});

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}