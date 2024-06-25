import 'package:flutter/material.dart';
import 'package:task_2/core/enums/movie_type_enum.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/see_more_popular_bloc_builder.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/see_more_top_rated_bloc_builder.dart';

class SeeMoreViewBody extends StatelessWidget {
  const SeeMoreViewBody({super.key, required this.movieType});
  final MovieTypeEnum movieType;

  @override
  Widget build(BuildContext context) {
    if (movieType == MovieTypeEnum.popular) {
      return const SeeMorePopularBlocBuilder();
    } else {
      return const SeeMoreTopRatedBlocBuilder();
    }
  }
}
