import 'package:flutter/material.dart';
import 'package:task_2/core/entities/base_movie_entity.dart';
import 'package:task_2/core/theme/app_colors.dart';

class DateAndRatingWidget extends StatelessWidget {
  const DateAndRatingWidget({
    super.key,
    this.color,
    required this.baseMovieEntity,
  });

  final Color? color;
  final BaseMovieEntity baseMovieEntity;

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
          child: Text(baseMovieEntity.date.length < 4
              ? "Not Available"
              : baseMovieEntity.date.substring(0, 4)),
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.star,
          color: AppColors.yellowColor,
          size: 15,
        ),
        Text(baseMovieEntity.voteAverage.toString().substring(0, 3)),
      ],
    );
  }
}
