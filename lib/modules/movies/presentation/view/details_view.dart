import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/more_details_view_body.dart';

class DetailsView extends StatelessWidget {
  static const String routeName = '/details_view';
  const DetailsView({super.key, required this.movie});
  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: DetailsViewBody(
        movie: movie,
      ),
    );
  }
}
