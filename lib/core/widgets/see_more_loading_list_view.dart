import 'package:flutter/material.dart';
import 'package:task_2/core/widgets/custom_fading_widget.dart';
import 'package:task_2/core/widgets/movie_aspect_ratio.dart';

class SeeMoreLoadingListView extends StatelessWidget {
  const SeeMoreLoadingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 35,
        itemBuilder: (context, index) {
          return CustomFadingWidget(
              child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: const MovieAspectRatio(
                aspectRatio: 4 / 1.8,
              ),
            ),
          ));
        });
  }
}
