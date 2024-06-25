import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/widgets/custom_err_widget.dart';
import 'package:task_2/core/widgets/see_more_loading_list_view.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/see_more_movie_popular_list_view.dart';
import 'package:task_2/modules/movies/presentation/view_model/get_popular_cubit/get_popular_cubit.dart';

class SeeMorePopularBlocBuilder extends StatelessWidget {
  const SeeMorePopularBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPopularCubit, GetPopularState>(
        builder: (context, state) {
      if (state is GetPopularSuccess ||
          state is GetPopularPaginationFailure ||
          state is GetPopularPaginationLoading) {
        return SeeMoreMoviePopularListView(
          movies: BlocProvider.of<GetPopularCubit>(context).movies,
        );
      } else if (state is GetPopularFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const SeeMoreLoadingListView();
      }
    });
  }
}
