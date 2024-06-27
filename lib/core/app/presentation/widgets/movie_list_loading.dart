import 'package:flutter/material.dart';
import 'package:task_2/core/app/presentation/widgets/custom_fading_widget.dart';
import 'package:task_2/core/app/presentation/widgets/movie_aspect_ratio.dart';

class MovieListLoading extends StatelessWidget {
  const MovieListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 5),
          child: CustomFadingWidget(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: const MovieAspectRatio(
                aspectRatio: 2.8 / 4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
