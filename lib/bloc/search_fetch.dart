import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:movie_rest_bloc/bloc/block.dart';
import 'package:movie_rest_bloc/model/popularmovie/popular.dart';
import 'package:movie_rest_bloc/model/search_movie/searchmovie.dart';
import 'package:movie_rest_bloc/service/model_converter/model_converter.dart';
import 'package:movie_rest_bloc/service/model_converter/searchmovie_model_converter.dart';
import 'package:movie_rest_bloc/service/movie_service.dart';

class SearchFetch implements Bloc{

  final _controller = StreamController<Response<SearchMovie>>();
  final _client = MovieService.create((SearchMovieModelConverter()));

  Stream<Response<SearchMovie>> get searchedStream => _controller.stream;

  void submitMoviesQuery(String query) async {
    final result = await _client.getSearchMovie(query);
    _controller.sink.add(result);
  }

  @override
  void dispose() {
    _controller.close();
  }

}