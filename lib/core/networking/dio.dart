import 'package:dio/dio.dart';
import 'package:task_2/core/networking/api_constance.dart';
import 'package:task_2/core/networking/api_service.dart';

class DioService extends ApiService {
  final Dio _dio;

  DioService(this._dio);

  @override
  Future<Map<String, dynamic>> get({required String endPoint,Map<String,dynamic>?headers}) async {
    var response = await _dio.get(
      ApiConstance.baseUrl + endPoint,
      options: Options(
        headers: headers??{'Authorization': 'Bearer ${ApiConstance.apiKey}','accept':"application/json"},
      ),
    );
    return response.data;
  }
}
