import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';
import 'package:task_2/modules/tv/domain/usecases/get_top_rated_tv_usercase.dart';

part 'get_tv_top_rated_state.dart';

class GetTvTopRatedCubit extends Cubit<GetTvTopRatedState> {
  GetTvTopRatedCubit(this.getTopRatedTvUsercase)
      : super(GetTvTopRatedInitial());
  final GetTopRatedTvUsercase getTopRatedTvUsercase;
  int nextPage = 1;
  List<TvEntity> tvs = [];

  Future<void> getTopRatedTv({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(GetTvTopRatedLoading());
    } else {
      emit(GetTvTopRatedPaginationLoading());
    }
    final result = await getTopRatedTvUsercase.execute(pageNumber: pageNumber);
    result.fold((l) {
      if (pageNumber == 1) {
        emit(GetTvTopRatedFailure(l.errMessage));
      } else {
        emit(GetTvTopRatedPaginationFailure(l.errMessage));
      }
    }, (r) {
      tvs.addAll(r);
      emit(GetTvTopRatedSuccess());
    });
  }
}
