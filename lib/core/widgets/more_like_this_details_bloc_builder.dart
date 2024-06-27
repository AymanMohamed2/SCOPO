import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/widgets/custom_err_widget.dart';
import 'package:task_2/core/widgets/custom_more_details_sliver_grid.dart';
import 'package:task_2/core/widgets/more_like_this_grid_view_loading.dart';
import 'package:task_2/core/view_model/git_more_like_this_cubit.dart/get_more_like_this_cubit.dart';
import 'package:task_2/core/widgets/no_data_widget.dart';

class MoreLikeThisBlocBuilder extends StatelessWidget {
  const MoreLikeThisBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMoreLikeThisCubit, GetMoreLikeThisState>(
        builder: (context, state) {
      if (state is GetMoreLikeThisSuccess) {
        if (state.movies.isEmpty) {
          return const SliverToBoxAdapter(child: NoDataWidget());
        } else {
          return CustomDetailsSliverGrid(
            movies: state.movies,
          );
        }
      } else if (state is GetMoreLikeThisFailure) {
        return SliverToBoxAdapter(
            child: CustomErrorWidget(errMessage: state.errMessage));
      } else {
        return const MoreLikeThisGridVieiwLoading();
      }
    });
  }
}
