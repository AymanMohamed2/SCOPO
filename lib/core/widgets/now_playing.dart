import 'package:flutter/material.dart';
import 'package:task_2/core/widgets/custom_now_playing_info.dart';
import 'package:task_2/core/widgets/custom_shadow.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/now_playing_image.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({
    super.key,
    required this.moviesEntity,
  });
  final MoviesEntity moviesEntity;

  @override
  Widget build(BuildContext context) {
    return CustomShadow(
      backChild: CustomNowPlayingImage(
        image: moviesEntity.image,
      ),
      frontChild: NowPlayingInfo(movieName: moviesEntity.title),
    );
  }
}
