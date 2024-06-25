part of 'get_more_like_this_cubit.dart';

@immutable
sealed class GetMoreLikeThisState {}

final class GetMoreLikeThisInitial extends GetMoreLikeThisState {}

final class GetMoreLikeThisLoading extends GetMoreLikeThisState {}

final class GetMoreLikeThisSuccess extends GetMoreLikeThisState {
  final List<MoviesEntity> movies;

  GetMoreLikeThisSuccess(this.movies);
}

final class GetMoreLikeThisFailure extends GetMoreLikeThisState {
  final String errMessage;

  GetMoreLikeThisFailure(this.errMessage);
}
