import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:movie_rest_bloc/model/cast/movie_cast.dart';
import 'package:movie_rest_bloc/service/model_converter/movie_cast_model_converter.dart';
import 'package:movie_rest_bloc/service/movie_service.dart';

import 'block.dart';

class MovieCastFetch implements Bloc{

  final _controller = StreamController<Response<MovieCast>>();
  final _client = MovieService.create(MovieCastModelConverter());

  Stream<Response<MovieCast>> get moviesCastStream => _controller.stream;

  void getMoviesList(String id) async {
    final result = await _client.getMovieCast(id);
    _controller.sink.add(result);
  }

  @override
  void dispose() {
    _controller.close();
  }

}