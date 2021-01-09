import 'package:chopper/chopper.dart';
import 'package:logging/logging.dart';
import 'package:movie_rest_bloc/model/popular.dart';
import 'header_interceptor.dart';
import 'model_converter.dart';

part 'movie_service.chopper.dart';

@ChopperApi()
abstract class MovieService extends ChopperService{

  @Get(path: 'movie/popular')
  Future<Response<Popular>> getPopularMovies();

  static MovieService create() {
    // 9
    final client = ChopperClient(
      // 10
      baseUrl: 'https://api.themoviedb.org/3',
      interceptors: [HeaderInterceptor(), HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: JsonConverter(),

      // 11
      services: [
        _$MovieService(),
      ],
    );
    // 12
    return _$MovieService(client);
  }
}