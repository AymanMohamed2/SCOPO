import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/widgets/see_more_item.dart';
import 'package:task_2/modules/movies/presentation/view_model/get_popular_cubit/get_popular_cubit.dart';

class SeeMoreMoviePopularListView extends StatefulWidget {
  const SeeMoreMoviePopularListView({super.key});

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
        setState(() {});
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
        itemCount: BlocProvider.of<GetPopularCubit>(context).movies.length,
        itemBuilder: (context, index) {
          return SeeMoreItem(
            movie: BlocProvider.of<GetPopularCubit>(context).movies[index],
          );
        });
  }
}
