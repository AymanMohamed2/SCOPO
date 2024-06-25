part of 'get_tv_top_rated_cubit.dart';

@immutable
sealed class GetTvTopRatedState {}

final class GetTvTopRatedInitial extends GetTvTopRatedState {}

final class GetTvTopRatedLoading extends GetTvTopRatedState {}

final class GetTvTopRatedSuccess extends GetTvTopRatedState {}

final class GetTvTopRatedFailure extends GetTvTopRatedState {
  final String errMessage;

  GetTvTopRatedFailure(this.errMessage);
}

final class GetTvTopRatedPaginationLoading extends GetTvTopRatedState {}

final class GetTvTopRatedPaginationFailure extends GetTvTopRatedState {
  final String errMessage;

  GetTvTopRatedPaginationFailure(this.errMessage);
}
