import 'package:task_2/core/networking/api_service.dart';
import 'package:task_2/core/networking/end_points.dart';
import 'package:task_2/core/networking/queries.dart';
import 'package:task_2/modules/tv/data/models/movies_model/tv_model.dart';
import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';

class RemoteDataSource {
  final ApiService apiService;

  RemoteDataSource(this.apiService);

  Future<List<TvEntity>> getOnTheAirTv({int pageNumber = 1}) async {
    final response = await apiService.get(endPoint: EndPoints.tvOnTheAir+Queries.tvOnTheAirQuery+pageNumber.toString());
    return TvShow.fromJson(response).results;
    
  }
   Future<List<TvEntity>> getPopularTv({int pageNumber = 1}) async {
    final response = await apiService.get(endPoint: EndPoints.tvPopular+Queries.tvPopularQuery+pageNumber.toString());
    return TvShow.fromJson(response).results;
    
  }
   Future<List<TvEntity>> getTopRatedTv({int pageNumber = 1}) async {
    final response = await apiService.get(endPoint: EndPoints.tvTopRated+Queries.tvTopRatedQuery+pageNumber.toString());
    return TvShow.fromJson(response).results;
    
  }
}

