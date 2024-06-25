import 'package:dartz/dartz.dart';
import 'package:task_2/core/errors/faliure.dart';
import 'package:task_2/modules/tv/domain/repositories/tv_repository.dart';

import '../entities/tv_entity.dart';

class GetOnTheAirUsecase {
  final TvRepository tvRepository;

  GetOnTheAirUsecase(this.tvRepository);

  Future<Either<Failure, List<TvEntity>>> execute() async {
    return tvRepository.getOnTheAirTv();
  }
}
