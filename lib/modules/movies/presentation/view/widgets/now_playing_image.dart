import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_2/core/networking/api_constance.dart';
import 'package:task_2/core/app/presentation/widgets/fading_loading_image.dart';

class CustomNowPlayingImage extends StatelessWidget {
  const CustomNowPlayingImage({super.key, this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: ApiConstance.imageBaseUrl + (image ?? ''),
        placeholder: (context, url) => const FadinImageLoading(),
        errorWidget: (context, value, url) => const Icon(Icons.image),
      ),
    );
  }
}
