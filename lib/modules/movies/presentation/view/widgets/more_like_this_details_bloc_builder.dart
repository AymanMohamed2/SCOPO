import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/custom_more_details_sliver_grid.dart';
import 'package:task_2/modules/movies/presentation/view_model/get_popular_cubit/get_popular_cubit.dart';

class MoreLikeThisBlocBuilder extends StatelessWidget {
  const MoreLikeThisBlocBuilder({
    super.key,
    required this.movie,
  });

  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPopularCubit, GetPopularState>(
        builder: (context, state) {
      return CustomDetailsSliverGrid(movie: movie);
    });
  }
}
