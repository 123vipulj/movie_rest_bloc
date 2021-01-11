import 'package:json_annotation/json_annotation.dart';

import 'actor_known_for.dart';

part 'actor_details.g.dart';

@JsonSerializable()
class ActorDetails{
  @JsonKey(name: 'name')
  String actorName;
  @JsonKey(name: 'popularity')
  double popularity;
  @JsonKey(name: 'profile_path')
  String profilePicUrl;
  List<ActorKnownFor> known_for;

  ActorDetails({
      this.actorName, this.popularity, this.profilePicUrl, this.known_for});

  factory ActorDetails.fromJson(Map<String, dynamic> json) => _$ActorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ActorDetailsToJson(this);
}