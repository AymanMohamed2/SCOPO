import 'package:flutter/material.dart';
import 'package:task_2/core/app/domain/entities/base_movie_entity.dart';
import 'package:task_2/core/app/presentation/widgets/custom_details_info.dart';
import 'package:task_2/core/app/presentation/widgets/details_image.dart';

class DetailsImageAndInfoSection extends StatelessWidget {
  const DetailsImageAndInfoSection({
    super.key,
    required this.baseMovieEntity,
  });

  final BaseMovieEntity baseMovieEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsImage(
          image: baseMovieEntity.image ?? '',
        ),
        const SizedBox(
          height: 10,
        ),
        CustomDetailsInfo(
          baseMovieEntity: baseMovieEntity,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
