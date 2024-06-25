import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/core/widgets/movie_image_item.dart';
import 'package:task_2/modules/movies/presentation/view/details_view.dart';
import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/see_mote_tv_item_info.dart';

class SeeMoreTvItem extends StatelessWidget {
  const SeeMoreTvItem({
    super.key,
    required this.tv,
  });
  final TvEntity tv;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsView.routeName, arguments: tv);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
            color: AppColors.lightBlack,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MovieImageItem(
                    image: tv.image,
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 5,
                child: SeeMoteTvItemInfo(
                  tv: tv,
                )),
          ],
        ),
      ),
    );
  }
}
