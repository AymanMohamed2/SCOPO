import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/widgets/custom_err_widget.dart';
import 'package:task_2/core/widgets/movie_list_loading.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/tv_popular_list_view.dart';
import 'package:task_2/modules/tv/presentation/view_model/get_tv_popular_cubit/get_tv_popular_cubit_cubit.dart';

class TvPopularBlocBuilder extends StatelessWidget {
  const TvPopularBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTvPopularCubitCubit, GetTvPopularState>(
        builder: (context, state) {
      if (state is GetTvPopularSuccess ||
          state is GetTvPopularPaginationLoading ||
          state is GetTvPopularPaginationFailure) {
        return TvPopularListView(
          tvs: BlocProvider.of<GetTvPopularCubitCubit>(context).tvs,
        );
      } else if (state is GetTvPopularFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const MovieListLoading();
      }
    });
  }
}
