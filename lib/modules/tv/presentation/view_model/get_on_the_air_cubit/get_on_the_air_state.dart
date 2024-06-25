part of 'get_on_the_air_cubit.dart';

@immutable
sealed class GetOnTheAirState {}

final class GetOnTheAirInitial extends GetOnTheAirState {}

final class GetOnTheAirLoading extends GetOnTheAirState {}

final class GetOnTheAirSuccess extends GetOnTheAirState {
  final TvEntity movie;

  GetOnTheAirSuccess(this.movie);
}

final class GetOnTheAirFailure extends GetOnTheAirState {
  final String errMessage;

  GetOnTheAirFailure(this.errMessage);
}
