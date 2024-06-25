import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

abstract class NowPlayingState {}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingFailure extends NowPlayingState {
  final String errMessage;

  NowPlayingFailure(this.errMessage);
}

class NowPlayingSuccess extends NowPlayingState {
  final List<MoviesEntity> movies;

  NowPlayingSuccess(this.movies);
}
