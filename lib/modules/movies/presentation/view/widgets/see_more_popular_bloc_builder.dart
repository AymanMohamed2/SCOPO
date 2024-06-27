import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/app/presentation/widgets/custom_err_widget.dart';
import 'package:task_2/core/app/presentation/widgets/see_more_loading_list_view.dart';
import 'package:task_2/core/app/presentation/widgets/see_more_list_view.dart';
import 'package:task_2/modules/movies/presentation/view/movie_details_view.dart';
import 'package:task_2/modules/movies/presentation/view_model/get_popular_cubit/get_popular_cubit.dart';

class SeeMorePopularBlocBuilder extends StatelessWidget {
  const SeeMorePopularBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GetPopularCubit>(context);
    return BlocBuilder<GetPopularCubit, GetPopularState>(
        builder: (context, state) {
      if (state is GetPopularSuccess ||
          state is GetPopularPaginationFailure ||
          state is GetPopularPaginationLoading) {
        return SeeMoreListView(
          onTap: (value) {
            Navigator.pushNamed(context, MovieDetailsView.routeName,
                arguments: cubit.movies[value]);
          },
          onPaginationScroll: () async {
            cubit.getPopularMovies(pageNumber: ++cubit.nextPage);
          },
          baseMovieEntity: cubit.movies,
        );
      } else if (state is GetPopularFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const SeeMoreLoadingListView();
      }
    });
  }
}
