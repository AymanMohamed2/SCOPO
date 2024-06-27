import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_2/core/app/data/datasources/remote_app_data_source.dart';
import 'package:task_2/core/app/data/repository/app_repository_impl.dart';
import 'package:task_2/core/networking/dio.dart';
import 'package:task_2/modules/movies/data/datasources/remote_data_source.dart';
import 'package:task_2/modules/movies/data/repository/movie_repo_impl.dart';
import 'package:task_2/core/app/domain/usecases/get_more_like_this_use_case.dart';
import 'package:task_2/modules/movies/domain/usecases/now_playing_movies_usecase.dart';
import 'package:task_2/modules/movies/domain/usecases/popular_movies_usecase.dart';
import 'package:task_2/modules/movies/domain/usecases/top_rated_movies_usecase.dart';
import 'package:task_2/modules/tv/data/datasources/remote_data_source.dart';
import 'package:task_2/modules/tv/data/repository/tv_repo_impl.dart';
import 'package:task_2/modules/tv/domain/usecases/get_on_the_air_usecase.dart';
import 'package:task_2/modules/tv/domain/usecases/get_popular_tv_usecase.dart';
import 'package:task_2/modules/tv/domain/usecases/get_top_rated_tv_usercase.dart';

abstract class ServiceLocator {
  static var getIt = GetIt.instance;

  static void setup() {
    getIt.registerSingleton<Dio>(Dio());
    getIt.registerSingleton<DioService>(DioService(getIt.get<Dio>()));

    getIt.registerSingleton<MovieRemoteDataSource>(
        MovieRemoteDataSource(getIt.get<DioService>()));
    getIt.registerSingleton<MovieRepoImpl>(
        MovieRepoImpl(getIt.get<MovieRemoteDataSource>()));

    getIt.registerSingleton<NowPlayingMoviesUseCase>(
        NowPlayingMoviesUseCase(getIt.get<MovieRepoImpl>()));
    getIt.registerSingleton<PopularMoviesUseCase>(
        PopularMoviesUseCase(getIt.get<MovieRepoImpl>()));
    getIt.registerSingleton<TopRatedMoviesUseCase>(
        TopRatedMoviesUseCase(getIt.get<MovieRepoImpl>()));
    getIt.registerSingleton<RemoteAppDataSource>(
        RemoteAppDataSource(getIt.get<DioService>()));
    getIt.registerSingleton<AppRepositoryImpl>(
        AppRepositoryImpl(getIt.get<RemoteAppDataSource>()));
    getIt.registerSingleton<GetMoreLikeThisUseCase>(
        GetMoreLikeThisUseCase(getIt.get<AppRepositoryImpl>()));
    getIt.registerSingleton<TvRemoteDataSource>(
        TvRemoteDataSource(getIt.get<DioService>()));

    getIt.registerSingleton<TvRepositoryImpl>(
        TvRepositoryImpl(getIt.get<TvRemoteDataSource>()));
    getIt.registerSingleton<GetOnTheAirUsecase>(
        GetOnTheAirUsecase(getIt.get<TvRepositoryImpl>()));
    getIt.registerSingleton<GetPopularTvUsecase>(
        GetPopularTvUsecase(getIt.get<TvRepositoryImpl>()));
    getIt.registerSingleton<GetTopRatedTvUsercase>(
        GetTopRatedTvUsercase(getIt.get<TvRepositoryImpl>()));
  }
}
