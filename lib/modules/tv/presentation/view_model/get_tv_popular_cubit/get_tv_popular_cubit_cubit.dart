import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';

import '../../../domain/usecases/get_popular_tv_usecase.dart';

part 'get_tv_popular_cubit_state.dart';

class GetTvPopularCubitCubit extends Cubit<GetTvPopularState> {
  GetTvPopularCubitCubit(this.getTvPopularUseCase)
      : super(GetTvPopularInitial());

  final GetPopularTvUsecase getTvPopularUseCase;
  List<TvEntity> tvs = [];
  int nextPage = 1;

  Future<void> getTvPopular({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(GetTvPopularLoading());
    } else {
      emit(GetTvPopularPaginationLoading());
    }
    final result = await getTvPopularUseCase.execute(pageNumber: pageNumber);
    result.fold((l) {
      if (pageNumber == 1) {
        emit(GetTvPopularFailure(l.errMessage));
      } else {
        emit(GetTvPopularPaginationFailure(l.errMessage));
      }
    }, (r) {
      tvs.addAll(r);

      emit(GetTvPopularSuccess(tvs));
    });
  }
}
