import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';
import 'package:task_2/modules/tv/domain/usecases/get_on_the_air_usecase.dart';

part 'get_on_the_air_state.dart';

class GetOnTheAirCubit extends Cubit<GetOnTheAirState> {
  GetOnTheAirCubit(this.getOnTheAirUsecase) : super(GetOnTheAirInitial());
  final GetOnTheAirUsecase getOnTheAirUsecase;

  Future<void> getOnTheAir() async {
    emit(GetOnTheAirLoading());
    final result = await getOnTheAirUsecase.execute();

    result.fold((failure) {
      emit(GetOnTheAirFailure(failure.errMessage));
    }, (movies) {
      emit(GetOnTheAirSuccess(movies[0]));
    });
  }
}
