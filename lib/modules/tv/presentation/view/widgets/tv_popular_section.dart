import 'package:flutter/material.dart';
import 'package:task_2/core/enums/movie_type_enum.dart';
import 'package:task_2/core/helper/see_more_arguments.dart';
import 'package:task_2/core/app/presentation/widgets/custom_header.dart';
import 'package:task_2/modules/tv/presentation/view/tv_see_more_view.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/tv_popular_bloc_builder.dart';

class TvPopularSection extends StatelessWidget {
  const TvPopularSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeader(
            title: 'Popular',
            onPressed: () {
              Navigator.pushNamed(context, TvSeeMoreView.routeName,
                  arguments: SeeMoreArguments(
                      appbarTitle: 'Popular Tv',
                      movieType: MovieTypeEnum.popular));
            }),
        const TvPopularBlocBuilder(),
      ],
    );
  }
}
