import 'package:chopper/chopper.dart';
import 'package:movie_rest_bloc/model/nowplaying.dart';
import 'package:movie_rest_bloc/model/popular.dart';
import 'header_interceptor.dart';
import 'model_converter.dart';

part 'movie_service.chopper.dart';

@ChopperApi()
abstract class MovieService extends ChopperService{

  @Get(path: 'movie/popular')
  Future<Response<Popular>> getPopularMovies();

  @Get(path: 'movie/now_playing')
  Future<Response<NowPlaying>> getNowPlayingMovies();

  static MovieService create(Converter converter) {
    final client = ChopperClient(
      baseUrl: 'https://api.themoviedb.org/3',
      interceptors: [HeaderInterceptor(), HttpLoggingInterceptor()],
      converter: converter,
      errorConverter: JsonConverter(),

      services: [
        _$MovieService(),
      ],
    );
    return _$MovieService(client);
  }
}