import 'package:flutter/material.dart';
import 'package:task_2/core/enums/movie_type_enum.dart';
import 'package:task_2/core/helper/see_more_arguments.dart';
import 'package:task_2/core/widgets/custom_header.dart';
import 'package:task_2/modules/movies/presentation/view/see_more_view.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/movie_top_rated_bloc_builder.dart';

class TopRatedSection extends StatelessWidget {
  const TopRatedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeader(
            title: 'Top Rated',
            onPressed: () {
              Navigator.pushNamed(context, SeeMoreView.routeName,
                  arguments: SeeMoreArguments(
                    appbarTitle: 'Top Rated',
                    movieType: MovieTypeEnum.topRated,
                  ));
            }),
        const TopRatedBlocBuilder(),
      ],
    );
  }
}
