import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:movie_rest_bloc/model/nowplaying.dart';
import 'package:movie_rest_bloc/service/movie_service.dart';
import 'package:movie_rest_bloc/service/nowplaying_model_converter.dart';

import 'block.dart';

class NowPlayingMovieFetch implements Bloc{

  final _controller = StreamController<Response<NowPlaying>>();
  final _client = MovieService.create(NowPlayingModelConverter());

  Stream<Response<NowPlaying>> get nowPlayingMoviesList => _controller.stream;

  void getNowPlayingMoviesList() async {
    final result = await _client.getNowPlayingMovies();
    _controller.sink.add(result);
  }

  @override
  void dispose() {
    _controller.close();
  }

}