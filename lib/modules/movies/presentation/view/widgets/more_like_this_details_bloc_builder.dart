import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/widgets/custom_err_widget.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/custom_more_details_sliver_grid.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/more_like_this_grid_view_loading.dart';
import 'package:task_2/modules/movies/presentation/view_model/git_more_like_this_cubit.dart/get_more_like_this_cubit.dart';

class MoreLikeThisBlocBuilder extends StatelessWidget {
  const MoreLikeThisBlocBuilder({
    super.key,
    required this.movie,
  });

  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMoreLikeThisCubit, GetMoreLikeThisState>(
        builder: (context, state) {
      if (state is GetMoreLikeThisSuccess) {
        return CustomDetailsSliverGrid(
          movies: state.movies,
        );
      } else if (state is GetMoreLikeThisFailure) {
        return SliverToBoxAdapter(
            child: CustomErrorWidget(errMessage: state.errMessage));
      } else {
        return const MoreLikeThisGridVieiwLoading();
      }
    });
  }
}
