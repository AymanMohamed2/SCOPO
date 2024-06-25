import 'package:flutter/material.dart';
import 'package:task_2/core/widgets/custom_fading_widget.dart';
import 'package:task_2/core/widgets/custom_shadow.dart';
import 'package:task_2/core/widgets/movie_aspect_ratio.dart';

class FadinImageLoading extends StatelessWidget {
  const FadinImageLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomFadingWidget(
        child: CustomShadow(
      backChild: MovieAspectRatio(),
    ));
  }
}
