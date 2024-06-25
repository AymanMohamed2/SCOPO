import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/widgets/see_more_item.dart';
import 'package:task_2/modules/movies/presentation/view_model/get_top_rated_cubit/get_top_rated_cubit.dart';

class SeeMoreMovieTopRatedListView extends StatefulWidget {
  const SeeMoreMovieTopRatedListView({super.key});

  @override
  State<SeeMoreMovieTopRatedListView> createState() =>
      _SeeMoreMovieTopRatedListViewState();
}

class _SeeMoreMovieTopRatedListViewState
    extends State<SeeMoreMovieTopRatedListView> {
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
        await BlocProvider.of<GetTopRatedCubit>(context).getTopRatedMovies(
            pageNumber: ++BlocProvider.of<GetTopRatedCubit>(context).nextPage);
        isLoading = false;
      }
      setState(() {});
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
        itemCount: BlocProvider.of<GetTopRatedCubit>(context).movies.length,
        itemBuilder: (context, index) {
          return SeeMoreItem(
            movie: BlocProvider.of<GetTopRatedCubit>(context).movies[index],
          );
        });
  }
}
