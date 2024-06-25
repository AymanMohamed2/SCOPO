import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_2/core/networking/dio.dart';
import 'package:task_2/modules/movies/data/datasources/remote_data_source.dart';
import 'package:task_2/modules/movies/data/repository/movie_repo_impl.dart';
import 'package:task_2/modules/movies/domain/usecases/now_playing_movies_usecase.dart';
import 'package:task_2/modules/movies/domain/usecases/popular_movies_usecase.dart';
import 'package:task_2/modules/movies/domain/usecases/top_rated_movies_usecase.dart';

abstract class ServiceLocator {
  static var getIt = GetIt.instance;

  static void setup() {
    getIt.registerSingleton<Dio>(Dio());
    getIt.registerSingleton<DioService>(DioService(getIt.get<Dio>()));

    getIt.registerSingleton<RemoteDataSource>(
        RemoteDataSource(getIt.get<DioService>()));
    getIt.registerSingleton<MovieRepoImpl>(
        MovieRepoImpl(getIt.get<RemoteDataSource>()));

    getIt.registerSingleton<NowPlayingMoviesUseCase>(
        NowPlayingMoviesUseCase(getIt.get<MovieRepoImpl>()));
    getIt.registerSingleton<PopularMoviesUseCase>(
        PopularMoviesUseCase(getIt.get<MovieRepoImpl>()));
    getIt.registerSingleton<TopRatedMoviesUseCase>(
        TopRatedMoviesUseCase(getIt.get<MovieRepoImpl>()));
  }
}
