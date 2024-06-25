import 'package:dartz/dartz.dart';

import '../../../../core/errors/faliure.dart';
import '../entities/tv_entity.dart';
import '../repositories/tv_repository.dart';

class GetTopRatedTvUsercase {
  final TvRepository repository;

  GetTopRatedTvUsercase(this.repository);

  Future<Either<Failure, List<TvEntity>>> execute() {
    return repository.getTopRatedTv();
  }
}
