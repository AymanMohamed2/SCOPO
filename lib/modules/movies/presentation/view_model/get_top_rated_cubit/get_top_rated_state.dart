part of 'get_top_rated_cubit.dart';

@immutable
sealed class GetTopRatedState {}

final class GetTopRatedInitial extends GetTopRatedState {}

final class GetTopRatedLoading extends GetTopRatedState {}

final class GetTopRatedSuccess extends GetTopRatedState {

}

final class GetTopRatedFailure extends GetTopRatedState {
  final String errMessage;

  GetTopRatedFailure(this.errMessage);
}

final class GetTopRatedPaginationFailure extends GetTopRatedState {
  final String errMessage;

  GetTopRatedPaginationFailure(this.errMessage);
}

final class GetTopRatedPaginationLoading extends GetTopRatedState {}
