import 'package:task_2/core/app/data/datasources/base_app_data_source.dart';
import 'package:task_2/core/networking/api_service.dart';
import 'package:task_2/core/networking/end_points.dart';
import 'package:task_2/core/networking/queries.dart';
import 'package:task_2/modules/movies/data/models/movies_model/movies_model.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

class RemoteAppDataSource extends BaseAppDataSource {
  final ApiService apiService;

  RemoteAppDataSource(this.apiService);
  @override
  Future<List<MoviesEntity>> getMoreLikeThis(
      {required String movieName}) async {
    final response = await apiService.get(
        endPoint:
            EndPoints.moreLikeThis + Queries.moreLikeThisQuery + movieName);
    return MovieModel.fromJson(response).results;
  }
}
