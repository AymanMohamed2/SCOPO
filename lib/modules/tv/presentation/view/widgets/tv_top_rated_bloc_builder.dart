import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/widgets/custom_err_widget.dart';
import 'package:task_2/core/widgets/movie_list_loading.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/get_tv_top_rated_list_view.dart';
import 'package:task_2/modules/tv/presentation/view_model/get_tv_top_rated.dart/get_tv_top_rated_cubit.dart';

class TvTopRatedBlocBuilder extends StatelessWidget {
  const TvTopRatedBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTvTopRatedCubit, GetTvTopRatedState>(
        builder: (context, state) {
      if (state is GetTvTopRatedSuccess ||
          state is GetTvTopRatedPaginationFailure ||
          state is GetTvTopRatedPaginationLoading) {
        return TvTopRatedListView(
          tvs: BlocProvider.of<GetTvTopRatedCubit>(context).tvs,
        );
      } else if (state is GetTvTopRatedFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const MovieListLoading();
      }
    });
  }
}
