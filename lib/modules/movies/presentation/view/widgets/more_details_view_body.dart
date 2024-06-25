import 'package:flutter/material.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/image_and_info_section.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/more_like_this_details_bloc_builder.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.movie});
  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ImageAndInfoSection(movie: movie),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        MoreLikeThisBlocBuilder(movie: movie)
      ],
    );
  }
}
