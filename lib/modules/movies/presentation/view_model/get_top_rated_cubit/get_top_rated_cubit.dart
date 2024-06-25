import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/modules/movies/domain/usecases/top_rated_movies_usecase.dart';

part 'get_top_rated_state.dart';

class GetTopRatedCubit extends Cubit<GetTopRatedState> {
  GetTopRatedCubit(this.topRatedMoviesUseCase) : super(GetTopRatedInitial());
  final TopRatedMoviesUseCase topRatedMoviesUseCase;
  List<MoviesEntity> movies = [];
  var nextPage = 1;


  Future<void> getTopRatedMovies({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(GetTopRatedLoading());
    } else {
      emit(GetTopRatedPaginationLoading());
    }
    final result = await topRatedMoviesUseCase.execute(pageNumber: pageNumber);
    result.fold((l) {
      if (pageNumber == 1) {
        emit(GetTopRatedFailure(l.errMessage));
      } else {
        emit(GetTopRatedPaginationFailure(l.errMessage));
      }
    }, (r) {
      movies.addAll(r);
      emit(GetTopRatedSuccess());
    });
  }
}
