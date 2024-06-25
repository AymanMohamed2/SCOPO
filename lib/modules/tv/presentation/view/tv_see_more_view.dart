import 'package:flutter/material.dart';
import 'package:task_2/core/enums/movie_type_enum.dart';
import 'package:task_2/core/helper/build_app_bar.dart';
import 'package:task_2/core/helper/see_more_arguments.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/tv_see_more_popular_bloc_builder.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/tv_see_more_top_rated_bloc_builder.dart';

class TvSeeMoreView extends StatelessWidget {
  static const String routeName = 'tv-see-more-view';
  const TvSeeMoreView({super.key, required this.arguments});
  final SeeMoreArguments arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      appBar: buildAppBar(context, title: arguments.appbarTitle),
      body: arguments.movieType == MovieTypeEnum.popular
          ? const TvSeeMorePopularBlocBuilder()
          : const TvSeeMoreTopRatedBlocBuilder(),
    );
  }
}
