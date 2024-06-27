import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_2/core/networking/api_constance.dart';
import 'package:task_2/core/app/presentation/widgets/custom_fading_widget.dart';
import 'package:task_2/core/app/presentation/widgets/movie_aspect_ratio.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
            aspectRatio: 3 / 2,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: ApiConstance.imageBaseUrl + image,
              placeholder: (context, url) {
                return const CustomFadingWidget(
                  child: MovieAspectRatio(
                    aspectRatio: 3 / 2,
                  ),
                );
              },
              errorWidget: (context, url, data) {
                return const MovieAspectRatio(
                  aspectRatio: 3 / 2,
                  child: Icon(Icons.image),
                );
              },
            )),
        Positioned(
            top: 20,
            left: 10,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)))
      ],
    );
  }
}
