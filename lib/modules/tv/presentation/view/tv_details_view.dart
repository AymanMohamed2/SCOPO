import 'package:flutter/material.dart';
import 'package:task_2/core/app/domain/entities/base_movie_entity.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/tv_details_view_body.dart';

class TvDetailsView extends StatelessWidget {
  static const String routeName = 'tv_details_view';
  const TvDetailsView({super.key, required this.baseMovieEntity});
  final BaseMovieEntity baseMovieEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: TvDetailsViewBody(
        baseMovieEntity: baseMovieEntity,
      ),
    );
  }
}
