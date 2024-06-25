part of 'get_popular_cubit.dart';

@immutable
sealed class GetPopularState {}

final class GetPopularInitial extends GetPopularState {}

final class GetPopularLoading extends GetPopularState {}

final class GetPopularSuccess extends GetPopularState {}

final class GetPopularFailure extends GetPopularState {
  final String errMessage;

  GetPopularFailure(this.errMessage);
}

final class GetPopularPaginationLoading extends GetPopularState {}

final class GetPopularPaginationFailure extends GetPopularState {
  final String errMessage;

  GetPopularPaginationFailure(this.errMessage);
}
