import 'package:flutter/material.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/now_playing_bloc_builder.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/popular_section.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/top_rated_section.dart';

class MovieViewBody extends StatelessWidget {
  const MovieViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: NowPlayingBlocBuilder(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: PopularSection(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 15,
          ),
        ),
        SliverToBoxAdapter(child: TopRatedSection()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
      ],
    );
  }
}
