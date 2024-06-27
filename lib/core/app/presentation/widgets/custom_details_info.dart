import 'package:flutter/material.dart';
import 'package:task_2/core/app/domain/entities/base_movie_entity.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/core/utils/styles.dart';
import 'package:task_2/core/app/presentation/widgets/date_and_rating_widget.dart';

class CustomDetailsInfo extends StatelessWidget {
  const CustomDetailsInfo({super.key, required this.baseMovieEntity});
  final BaseMovieEntity baseMovieEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            baseMovieEntity.title,
            style: AppStyles.getBold30(context),
            maxLines: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          DateAndRatingWidget(
            baseMovieEntity: baseMovieEntity,
            color: AppColors.lightGrey,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            baseMovieEntity.overview,
          ),
        ],
      ),
    );
  }
}
