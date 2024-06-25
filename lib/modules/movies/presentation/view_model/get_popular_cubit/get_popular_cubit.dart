import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/modules/movies/domain/usecases/popular_movies_usecase.dart';

part 'get_popular_state.dart';

class GetPopularCubit extends Cubit<GetPopularState> {
  GetPopularCubit(this.popularMoviesUseCase) : super(GetPopularInitial());
  final PopularMoviesUseCase popularMoviesUseCase;
  List<MoviesEntity> movies = [];
  var nextPage = 1;

  Future<void> getPopularMovies({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(GetPopularLoading());
    } else {
      emit(GetPopularPaginationLoading());
    }
    final result = await popularMoviesUseCase.execute(pageNumber: pageNumber);
    result.fold(
      (l) {
        if (pageNumber == 1) {
          emit(GetPopularFailure(l.errMessage));
        } else {
          emit(GetPopularPaginationFailure(l.errMessage));
        }
      },
      (r) {
        movies.addAll(r);

        emit(GetPopularSuccess());
      },
    );
  }
}
