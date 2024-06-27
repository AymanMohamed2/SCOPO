import 'package:flutter/material.dart';
import 'package:task_2/core/entities/base_movie_entity.dart';
import 'package:task_2/core/utils/styles.dart';
import 'package:task_2/core/widgets/details_image_and_info_section.dart';
import 'package:task_2/core/widgets/more_like_this_details_bloc_builder.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.baseMovieEntity});
  final BaseMovieEntity baseMovieEntity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: DetailsImageAndInfoSection(baseMovieEntity: baseMovieEntity),
        ),
        SliverToBoxAdapter(
          child: Text(
            '- MORE LIKE THIS -',
            textAlign: TextAlign.center,
            style: AppStyles.getSemiBold20(context),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        const MoreLikeThisBlocBuilder(),
      ],
    );
  }
}
