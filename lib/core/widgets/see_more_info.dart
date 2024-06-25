import 'package:flutter/material.dart';
import 'package:task_2/core/utils/styles.dart';
import 'package:task_2/core/widgets/date_and_rating_widget.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

class SeeMoreItemInfo extends StatelessWidget {
  const SeeMoreItemInfo({
    super.key,
    required this.movie,
    this.descreptionMaxLines,
  });
  final MoviesEntity movie;

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
            movie.title,
            style: AppStyles.getBold20(context),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(
            height: 5,
          ),
          DateAndRatingWidget(movie: movie),
          const SizedBox(
            height: 10,
          ),
          Text(
            movie.overview,
            maxLines: descreptionMaxLines ?? 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
