import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:movie_rest_bloc/model/moviedetails/movie_detail.dart';
import 'package:movie_rest_bloc/service/model_converter/movie_detail_model_converter.dart';
import 'package:movie_rest_bloc/service/movie_service.dart';

import 'block.dart';

class MovieDetailFetch implements Bloc{

final _controller = StreamController<Response<MovieDetail>>();
final _client = MovieService.create(MovieDetailModelConverter());

Stream<Response<MovieDetail>> get moviesDetailStream => _controller.stream;

void getMoviesList(String id) async {
  final result = await _client.getMoviesDetails(id);
  _controller.sink.add(result);
}

@override
void dispose() {
  _controller.close();
}

}