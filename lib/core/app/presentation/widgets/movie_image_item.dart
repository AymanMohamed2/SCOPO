import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_2/core/networking/api_constance.dart';
import 'package:task_2/core/app/presentation/widgets/cached_network_err_widget.dart';
import 'package:task_2/core/app/presentation/widgets/custom_fading_widget.dart';
import 'package:task_2/core/app/presentation/widgets/movie_aspect_ratio.dart';

class MovieImageItem extends StatelessWidget {
  const MovieImageItem({
    super.key,
    this.image,
    this.aspectRatio,
  });
  final String? image;
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: AspectRatio(
          aspectRatio: aspectRatio ?? 2.8 / 4,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: ApiConstance.imageBaseUrl + (image ?? ''),
            placeholder: (context, url) => const CustomFadingWidget(
              child: MovieAspectRatio(
                aspectRatio: 2.8 / 4,
              ),
            ),
            errorWidget: (context, url, error) =>
                const CachedNetworkErrorWidget(),
          ),
        ));
  }
}
