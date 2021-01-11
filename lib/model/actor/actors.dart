import 'package:json_annotation/json_annotation.dart';

import 'actor_details.dart';

part 'actors.g.dart';

@JsonSerializable()
class Actor {
  int page;
  List<ActorDetails> results;

  Actor({this.page, this.results});

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  Map<String, dynamic> toJson() => _$ActorToJson(this);
}