import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:movie_rest_bloc/bloc/block.dart';
import 'package:movie_rest_bloc/model/actor/actors.dart';
import 'package:movie_rest_bloc/service/model_converter/actors_model_converter.dart';
import 'package:movie_rest_bloc/service/movie_service.dart';

class ActorFetch extends Bloc{
  final _controller = StreamController<Response<Actor>>();
  final _client = MovieService.create(ActorModelConverter());

  Stream<Response<Actor>> get actorStream => _controller.stream;

  void fetchActorList() async{
    final result = await _client.getPopularActore();
    _controller.sink.add(result);
  }

  @override
  void dispose() {
    _controller.close();
  }

}