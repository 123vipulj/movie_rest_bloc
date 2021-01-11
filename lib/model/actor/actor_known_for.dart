import 'package:json_annotation/json_annotation.dart';
import 'package:movie_rest_bloc/model/actor/actors.dart';

part 'actor_known_for.g.dart';

@JsonSerializable()
class ActorKnownFor {
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'overview')
  String movieOverview;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'original_language')
  String language;

  ActorKnownFor({this.originalTitle, this.movieOverview, this.posterPath,
      this.releaseDate, this.voteAverage, this.voteCount, this.language});

  factory ActorKnownFor.fromJson(Map<String, dynamic> json) => _$ActorKnownForFromJson(json);

  Map<String, dynamic> toJson() => _$ActorKnownForToJson(this);
}