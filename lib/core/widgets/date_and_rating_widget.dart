import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

class DateAndRatingWidget extends StatelessWidget {
  const DateAndRatingWidget({
    super.key,
     this.color,
    required this.movie,
  });

  final Color? color;
  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: color ?? AppColors.redColor,
          ),
          child: Text(
            movie.date.substring(0, 4),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.star,
          color: AppColors.yellowColor,
          size: 15,
        ),
        Text(movie.voteAverage.toString()),
      ],
    );
  }
}
