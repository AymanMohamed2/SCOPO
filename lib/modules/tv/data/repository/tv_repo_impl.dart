import 'package:dartz/dartz.dart';
import 'package:task_2/core/errors/faliure.dart';
import 'package:task_2/modules/tv/data/datasources/remote_data_source.dart';
import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';
import 'package:task_2/modules/tv/domain/repositories/tv_repository.dart';

import '../../../../core/helper/get_failure.dart';

class TvRepositoryImpl extends TvRepository {
  final RemoteDataSource remoteDataSource;

  TvRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<TvEntity>>> getOnTheAirTv() async{
    try {
      final result = await remoteDataSource.getOnTheAirTv();
      return right(result);
    } on Exception catch (e) {
      return left(getFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<TvEntity>>> getPopularTv() async{
   try {
      final result = await remoteDataSource.getPopularTv();
      return right(result);
    } on Exception catch (e) {
      return left(getFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<TvEntity>>> getTopRatedTv() async{
   try {
      final result = await remoteDataSource.getTopRatedTv();
      return right(result);
    } on Exception catch (e) {
      return left(getFailure(e));
    }
  
}}
