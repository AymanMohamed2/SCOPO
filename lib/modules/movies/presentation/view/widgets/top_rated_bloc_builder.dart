import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/widgets/custom_err_widget.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/top_rated_list_view.dart';
import 'package:task_2/core/widgets/movie_list_loading.dart';
import 'package:task_2/modules/movies/presentation/view_model/get_top_rated_cubit/get_top_rated_cubit.dart';

class TopRatedBlocBuilder extends StatefulWidget {
  const TopRatedBlocBuilder({super.key});

  @override
  State<TopRatedBlocBuilder> createState() => _TopRatedBlocBuilderState();
}

class _TopRatedBlocBuilderState extends State<TopRatedBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GetTopRatedCubit>(context);
    return BlocBuilder<GetTopRatedCubit, GetTopRatedState>(
        builder: (context, state) {
      if (state is GetTopRatedSuccess ||
          state is GetTopRatedPaginationFailure ||
          state is GetTopRatedPaginationLoading) {
        return TopRatedListView(moviesEntity: cubit.movies);
      } else if (state is GetTopRatedFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const MovieListLoading();
      }
    });
  }
}
