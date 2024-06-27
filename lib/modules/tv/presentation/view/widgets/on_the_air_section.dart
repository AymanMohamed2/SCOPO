import 'package:flutter/material.dart';
import 'package:task_2/core/app/presentation/widgets/custom_now_playing_info.dart';
import 'package:task_2/core/app/presentation/widgets/custom_shadow.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/now_playing_image.dart';
import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';

class OnTheAirSection extends StatelessWidget {
  const OnTheAirSection({super.key, required this.tv});
  final TvEntity tv;
  @override
  Widget build(BuildContext context) {
    return CustomShadow(
      backChild: CustomNowPlayingImage(
        image: tv.image,
      ),
      frontChild: NowPlayingInfo(
        movieName: tv.title,
        title: 'ON THE AIR',
      ),
    );
  }
}
