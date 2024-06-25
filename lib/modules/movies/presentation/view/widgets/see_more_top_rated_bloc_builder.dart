import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/widgets/custom_err_widget.dart';
import 'package:task_2/core/widgets/see_more_loading_list_view.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/see_more_movie_top_rated_list_view.dart';
import 'package:task_2/modules/movies/presentation/view_model/get_top_rated_cubit/get_top_rated_cubit.dart';

class SeeMoreTopRatedBlocBuilder extends StatelessWidget {
  const SeeMoreTopRatedBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTopRatedCubit, GetTopRatedState>(
        builder: (context, state) {
      if (state is GetTopRatedSuccess ||
          state is GetTopRatedPaginationFailure ||
          state is GetTopRatedPaginationLoading) {
        return SeeMoreMovieTopRatedListView(
          movies: BlocProvider.of<GetTopRatedCubit>(context).movies,
        );
      } else if (state is GetTopRatedFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const SeeMoreLoadingListView();
      }
    });
  }
}
