 import 'package:dio/dio.dart';
import 'package:task_2/core/errors/faliure.dart';
import 'package:task_2/core/errors/server_failure.dart';

Failure getFailure(Exception e) {
    if (e is DioException) {
      return ServerFailure.fromDioException(e);
    } else {
      return ServerFailure(e.toString());
    }
  }