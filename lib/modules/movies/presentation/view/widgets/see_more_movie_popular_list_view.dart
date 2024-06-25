import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/see_more_movie_item.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/modules/movies/presentation/view_model/get_popular_cubit/get_popular_cubit.dart';

class SeeMoreMoviePopularListView extends StatefulWidget {
  const SeeMoreMoviePopularListView({super.key, required this.movies});
  final List<MoviesEntity> movies;

  @override
  State<SeeMoreMoviePopularListView> createState() =>
      _SeeMoreMoviePopularListViewState();
}

class _SeeMoreMoviePopularListViewState
    extends State<SeeMoreMoviePopularListView> {
  late final ScrollController _scrollController;

  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<GetPopularCubit>(context).getPopularMovies(
            pageNumber: ++BlocProvider.of<GetPopularCubit>(context).nextPage);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          return SeeMoreItem(
            movie: widget.movies[index],
          );
        });
  }
}
