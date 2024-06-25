import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/modules/movies/domain/usecases/now_playing_movies_usecase.dart';
import 'package:task_2/modules/movies/presentation/view_model/now_playing_cubit/now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit(this.nowPlayingMoviesUseCase) : super(NowPlayingInitial());
  final NowPlayingMoviesUseCase nowPlayingMoviesUseCase;

  Future<void> getNowPlayingMovies({int pageNumber = 1}) async {
    emit(NowPlayingLoading());
    final result =
        await nowPlayingMoviesUseCase.execute(pageNumber: pageNumber);
    result.fold(
      (l) => emit(
        NowPlayingFailure(l.errMessage),
      ),
      (r) => emit(
        NowPlayingSuccess(r),
      ),
    );
  }
}
