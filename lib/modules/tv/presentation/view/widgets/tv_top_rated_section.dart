import 'package:flutter/material.dart';
import 'package:task_2/core/enums/movie_type_enum.dart';
import 'package:task_2/core/helper/see_more_arguments.dart';
import 'package:task_2/core/app/presentation/widgets/custom_header.dart';
import 'package:task_2/modules/tv/presentation/view/tv_see_more_view.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/tv_top_rated_bloc_builder.dart';

class TvTopRatedSection extends StatelessWidget {
  const TvTopRatedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeader(
          title: 'Top Rated',
          onPressed: () {
            Navigator.pushNamed(context, TvSeeMoreView.routeName,
                arguments: SeeMoreArguments(
                    appbarTitle: 'Top Rated Tv',
                    movieType: MovieTypeEnum.topRated));
          },
        ),
        const TvTopRatedBlocBuilder(),
      ],
    );
  }
}
