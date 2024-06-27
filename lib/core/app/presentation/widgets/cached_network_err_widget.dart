import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/core/app/presentation/widgets/movie_aspect_ratio.dart';

class CachedNetworkErrorWidget extends StatelessWidget {
  const CachedNetworkErrorWidget({
    super.key,
    this.aspectRatio,
  });
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey,
      child: MovieAspectRatio(
          aspectRatio: aspectRatio ?? 2.8 / 4, child: const Icon(Icons.image)),
    );
  }
}
