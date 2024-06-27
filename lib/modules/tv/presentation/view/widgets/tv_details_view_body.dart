import 'package:flutter/material.dart';
import 'package:task_2/core/app/domain/entities/base_movie_entity.dart';
import 'package:task_2/core/app/presentation/widgets/details_image_and_info_section.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/custom_tap_bar_section.dart';

class TvDetailsViewBody extends StatelessWidget {
  const TvDetailsViewBody({super.key, required this.baseMovieEntity});
  final BaseMovieEntity baseMovieEntity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: DetailsImageAndInfoSection(baseMovieEntity: baseMovieEntity),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: CusttomTapBarSection(
            baseMovieEntity: baseMovieEntity,
          ),
        ),
      ],
    );
  }
}
