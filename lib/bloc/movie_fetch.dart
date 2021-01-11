import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:movie_rest_bloc/bloc/block.dart';
import 'package:movie_rest_bloc/model/popularmovie/popular.dart';
import 'package:movie_rest_bloc/service/model_converter/model_converter.dart';
import 'package:movie_rest_bloc/service/movie_service.dart';

class MovieFetch implements Bloc{

  final _controller = StreamController<Response<Popular>>();
  final _client = MovieService.create(ModelConverter());

  Stream<Response<Popular>> get moviesList => _controller.stream;

  void getMoviesList() async {
    final result = await _client.getPopularMovies();
    _controller.sink.add(result);
  }

  @override
  void dispose() {
    _controller.close();
  }

}