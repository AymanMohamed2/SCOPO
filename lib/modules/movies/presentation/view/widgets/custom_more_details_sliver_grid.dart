import 'package:flutter/material.dart';
import 'package:task_2/core/widgets/movie_image_item.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

class CustomDetailsSliverGrid extends StatelessWidget {
  const CustomDetailsSliverGrid({
    super.key,
    required this.movie,
  });

  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 2.8 / 4),
        itemBuilder: (context, index) {
          return MovieImageItem(image: movie.image);
        });
  }
}
