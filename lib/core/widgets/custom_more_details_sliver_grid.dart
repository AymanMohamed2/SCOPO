import 'package:flutter/material.dart';
import 'package:task_2/core/entities/base_movie_entity.dart';
import 'package:task_2/core/widgets/movie_image_item.dart';
import 'package:task_2/modules/movies/presentation/view/movie_details_view.dart';

class CustomDetailsSliverGrid extends StatelessWidget {
  const CustomDetailsSliverGrid({
    super.key,
    required this.movies,
  });

  final List<BaseMovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid.builder(
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 2.8 / 4),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, MovieDetailsView.routeName,
                      arguments: movies[index]);
                },
                child: MovieImageItem(image: movies[index].image));
          }),
    );
  }
}
