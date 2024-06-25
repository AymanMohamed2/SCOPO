import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/core/widgets/movie_image_item.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/see_more_movie_info.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/modules/movies/presentation/view/details_view.dart';

class SeeMoreItem extends StatelessWidget {
  const SeeMoreItem({
    super.key,
    required this.movie,
  });
  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsView.routeName, arguments: movie);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
            color: AppColors.lightBlack,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MovieImageItem(
                    image: movie.image,
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 5,
                child: SeeMoreItemInfo(
                  movie: movie,
                )),
          ],
        ),
      ),
    );
  }
}
