import 'package:flutter/material.dart';
import 'package:task_2/core/app/domain/entities/base_movie_entity.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/core/app/presentation/widgets/movie_image_item.dart';
import 'package:task_2/core/app/presentation/widgets/see_more_info.dart';
import 'package:task_2/modules/movies/presentation/view/movie_details_view.dart';

class SeeMoreItem extends StatelessWidget {
  const SeeMoreItem({
    super.key,
    required this.movie,
    this.onTap,
  });
  final BaseMovieEntity movie;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.pushNamed(context, MovieDetailsView.routeName,
                arguments: movie);
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
                  baseMovieEntity: movie,
                )),
          ],
        ),
      ),
    );
  }
}
