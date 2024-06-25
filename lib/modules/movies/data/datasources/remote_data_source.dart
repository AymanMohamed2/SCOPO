import 'package:task_2/core/networking/api_service.dart';
import 'package:task_2/core/networking/end_points.dart';
import 'package:task_2/core/networking/queries.dart';

import '../../domain/entities/now_playing_movies_entity.dart';
import '../models/movies_model/movies_model.dart';

class RemoteDataSource {
  final ApiService apiService;

  RemoteDataSource(this.apiService);

  Future<List<MoviesEntity>> getNowPlayingMovies({int pageNumber = 1}) async {
    final response = await apiService.get(
        endPoint: EndPoints.movieNowPlaying +
            Queries.getNoPlayingQuery +
            pageNumber.toString());

    return MovieModel.fromJson(response).results;
  }

  Future<List<MoviesEntity>> getPopularMovies({int pageNumber = 1}) async {
    final response = await apiService.get(
        endPoint: EndPoints.moviePopular +
            Queries.getPopularQuery +
            pageNumber.toString());
    print(response['page']);
    return MovieModel.fromJson(response).results;
  }

  Future<List<MoviesEntity>> getTopRatedMovies({int pageNumber = 1}) async {
    final response = await apiService.get(
        endPoint: EndPoints.movieTopRated +
            Queries.getTopRatedQuery +
            pageNumber.toString());
    return MovieModel.fromJson(response).results;
  }
}
