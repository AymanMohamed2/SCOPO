import 'package:flutter/material.dart';
import 'package:task_2/core/utils/styles.dart';
import 'package:task_2/core/widgets/custom_details_info.dart';
import 'package:task_2/core/widgets/details_image.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

class ImageAndInfoSection extends StatelessWidget {
  const ImageAndInfoSection({
    super.key,
    required this.movie,
  });

  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsImage(
          image: movie.image ?? '',
        ),
        const SizedBox(
          height: 10,
        ),
        CustomDetailsInfo(
          movie: movie,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '- MORE LIKE THIS -',
          style: AppStyles.getSemiBold20(context),
        ),
      ],
    );
  }
}
