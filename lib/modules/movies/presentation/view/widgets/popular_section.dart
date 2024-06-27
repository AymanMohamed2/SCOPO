import 'package:flutter/material.dart';
import 'package:task_2/core/enums/movie_type_enum.dart';
import 'package:task_2/core/helper/see_more_arguments.dart';
import 'package:task_2/core/app/presentation/widgets/custom_header.dart';
import 'package:task_2/modules/movies/presentation/view/see_more_view.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/popular_bloc_builder.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeader(
          title: 'Popular',
          onPressed: () {
            Navigator.pushNamed(
              context,
              SeeMoreView.routeName,
              arguments: SeeMoreArguments(
                  appbarTitle: 'Popular Movies',
                  movieType: MovieTypeEnum.popular),
            );
          },
        ),
        const PopularBlocBuilder(),
      ],
    );
  }
}
