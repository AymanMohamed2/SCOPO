import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';

class TvDateAndRatingWidget extends StatelessWidget {
  const TvDateAndRatingWidget({
    super.key,
    this.color,
    required this.tv,
  });

  final Color? color;
  final TvEntity tv;

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
            tv.releaseDate.substring(0, 4),
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
        Text(tv.rating.toString().substring(0, 3)),
      ],
    );
  }
}
