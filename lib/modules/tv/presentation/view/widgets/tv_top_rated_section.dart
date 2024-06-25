import 'package:flutter/material.dart';
import 'package:task_2/core/widgets/custom_header.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/tv_top_rated_bloc_builder.dart';

class TvTopRatedSection extends StatelessWidget {
  const TvTopRatedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeader(
          title: 'Top Rated',
          onPressed: () {},
        ),
        const TvTopRatedBlocBuilder(),
      ],
    );
  }
}
