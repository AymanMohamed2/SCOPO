import 'package:flutter/material.dart';
import 'package:task_2/core/app/presentation/widgets/custom_fading_widget.dart';
import 'package:task_2/core/app/presentation/widgets/movie_aspect_ratio.dart';

class MoreLikeThisGridVieiwLoading extends StatelessWidget {
  const MoreLikeThisGridVieiwLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 2.8 / 4),
        itemCount: 20,
        itemBuilder: (context, index) {
          return CustomFadingWidget(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: const MovieAspectRatio(
                aspectRatio: 2.8 / 4,
              ),
            ),
          );
        });
  }
}
