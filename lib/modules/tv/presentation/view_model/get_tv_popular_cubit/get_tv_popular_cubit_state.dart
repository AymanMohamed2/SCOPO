part of 'get_tv_popular_cubit_cubit.dart';

@immutable
sealed class GetTvPopularState {}

final class GetTvPopularInitial extends GetTvPopularState {}

final class GetTvPopularLoading extends GetTvPopularState {}

final class GetTvPopularSuccess extends GetTvPopularState {
  final List<TvEntity> tvs;

  GetTvPopularSuccess(this.tvs);
}

final class GetTvPopularFailure extends GetTvPopularState {
  final String errMessage;

  GetTvPopularFailure(this.errMessage);
}

final class GetTvPopularPaginationFailure extends GetTvPopularState {
  final String errMessage;

  GetTvPopularPaginationFailure(this.errMessage);
}

final class GetTvPopularPaginationLoading extends GetTvPopularState {}
