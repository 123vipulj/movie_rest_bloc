// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$MovieService extends MovieService {
  _$MovieService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MovieService;

  @override
  Future<Response<Popular>> getPopularMovies() {
    final $url = 'movie/popular';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Popular, Popular>($request);
  }

  @override
  Future<Response<NowPlaying>> getNowPlayingMovies() {
    final $url = 'movie/now_playing';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<NowPlaying, NowPlaying>($request);
  }

  @override
  Future<Response<Actor>> getPopularActore() {
    final $url = 'person/popular';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Actor, Actor>($request);
  }

  @override
  Future<Response<SearchMovie>> getSearchMovie(String query) {
    final $url = 'search/movie';
    final $request = Request('GET', $url, client.baseUrl, parameters: {'query' : query});
    return client.send<SearchMovie, SearchMovie>($request);
  }

  @override
  Future<Response<MovieDetail>> getMoviesDetails(String id) {
    final $url = 'movie/' +id;
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MovieDetail, MovieDetail>($request);
  }

  @override
  Future<Response<MovieCast>> getMovieCast(String id) {
    final $url = 'movie/' + id +"/credits";
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MovieCast, MovieCast>($request);
  }
}
