import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/core/app/domain/usecases/get_more_like_this_use_case.dart';

part 'get_more_like_this_state.dart';

class GetMoreLikeThisCubit extends Cubit<GetMoreLikeThisState> {
  GetMoreLikeThisCubit(this.getMoreLikeThisUseCase)
      : super(GetMoreLikeThisInitial());
  final GetMoreLikeThisUseCase getMoreLikeThisUseCase;
  Future<void> getMoreLikeThis({required String movieName}) async {
    emit(GetMoreLikeThisLoading());
    final result = await getMoreLikeThisUseCase.execute(movieName);
    result.fold(
      (l) => emit(GetMoreLikeThisFailure(l.errMessage)),
      (r) => emit(GetMoreLikeThisSuccess(r)),
    );
  }
}
