import 'package:flutter/material.dart';
import 'package:task_2/core/widgets/custom_header.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/tv_popular_bloc_builder.dart';

class TvPopularSection extends StatelessWidget {
  const TvPopularSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeader(title: 'Popular', onPressed: () {}),
        const TvPopularBlocBuilder(),
      ],
    );
  }
}
