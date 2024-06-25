import 'package:dartz/dartz.dart';
import 'package:task_2/core/errors/faliure.dart';
import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';

import '../repositories/tv_repository.dart';

class GetPopularTvUsecase {
  final TvRepository tvRepository;

  GetPopularTvUsecase(this.tvRepository);
  Future<Either<Failure, List<TvEntity>>> execute() {
    return tvRepository.getPopularTv();
  }
}
