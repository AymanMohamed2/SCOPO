
abstract class ApiService {
  Future<Map<String,dynamic>> get({required String endPoint,Map<String,dynamic>?headers});

}