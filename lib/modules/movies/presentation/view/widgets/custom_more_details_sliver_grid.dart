import 'package:flutter/material.dart';
import 'package:task_2/core/widgets/movie_image_item.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/modules/movies/presentation/view/details_view.dart';

class CustomDetailsSliverGrid extends StatelessWidget {
  const CustomDetailsSliverGrid({
    super.key,
    required this.movies,
  });

  final List<MoviesEntity> movies;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: movies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 2.8 / 4),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, DetailsView.routeName,
                    arguments: movies[index]);
              },
              child: MovieImageItem(image: movies[index].image));
        });
  }
}
