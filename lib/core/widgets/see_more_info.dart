import 'package:flutter/material.dart';
import 'package:task_2/core/entities/base_movie_entity.dart';
import 'package:task_2/core/utils/styles.dart';
import 'package:task_2/core/widgets/date_and_rating_widget.dart';

class SeeMoreItemInfo extends StatelessWidget {
  const SeeMoreItemInfo({
    super.key,
    required this.baseMovieEntity,
    this.descreptionMaxLines,
  });
  final BaseMovieEntity baseMovieEntity;

  final int? descreptionMaxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 18,
          ),
          Text(
            baseMovieEntity.title,
            style: AppStyles.getBold20(context),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(
            height: 5,
          ),
          DateAndRatingWidget(baseMovieEntity: baseMovieEntity),
          const SizedBox(
            height: 10,
          ),
          Text(
            baseMovieEntity.overview,
            maxLines: descreptionMaxLines ?? 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
