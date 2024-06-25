import 'package:flutter/material.dart';
import 'package:task_2/core/utils/styles.dart';
import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/tv_date_and_rating_widget.dart';

class SeeMoteTvItemInfo extends StatelessWidget {
  const SeeMoteTvItemInfo({
    super.key,
    required this.tv,
    this.descreptionMaxLines,
  });
  final TvEntity tv;

  final int? descreptionMaxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 18,
          ),
          Text(
            tv.title,
            style: AppStyles.getBold20(context),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(
            height: 5,
          ),
          TvDateAndRatingWidget(tv: tv),
          const SizedBox(
            height: 10,
          ),
          Text(
            tv.description,
            maxLines: descreptionMaxLines ?? 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
