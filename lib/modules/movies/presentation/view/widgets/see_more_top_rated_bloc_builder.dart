import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/app/presentation/widgets/custom_err_widget.dart';
import 'package:task_2/core/app/presentation/widgets/see_more_list_view.dart';
import 'package:task_2/core/app/presentation/widgets/see_more_loading_list_view.dart';
import 'package:task_2/modules/movies/presentation/view/movie_details_view.dart';
import 'package:task_2/modules/movies/presentation/view_model/get_top_rated_cubit/get_top_rated_cubit.dart';

class SeeMoreTopRatedBlocBuilder extends StatelessWidget {
  const SeeMoreTopRatedBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GetTopRatedCubit>(context);
    return BlocBuilder<GetTopRatedCubit, GetTopRatedState>(
        builder: (context, state) {
      if (state is GetTopRatedSuccess ||
          state is GetTopRatedPaginationFailure ||
          state is GetTopRatedPaginationLoading) {
        return SeeMoreListView(
          onTap: (value) {
            Navigator.pushNamed(context, MovieDetailsView.routeName,
                arguments: cubit.movies[value]);
          },
          onPaginationScroll: () async {
            cubit.getTopRatedMovies(pageNumber: ++cubit.nextPage);
          },
          baseMovieEntity: cubit.movies,
        );
      } else if (state is GetTopRatedFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const SeeMoreLoadingListView();
      }
    });
  }
}
