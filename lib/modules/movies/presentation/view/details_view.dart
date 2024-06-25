import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/core/utils/service_locator.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/modules/movies/domain/usecases/get_more_like_this_use_case.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/more_details_view_body.dart';
import 'package:task_2/modules/movies/presentation/view_model/git_more_like_this_cubit.dart/get_more_like_this_cubit.dart';

class DetailsView extends StatelessWidget {
  static const String routeName = '/details_view';
  const DetailsView({super.key, required this.movie});
  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMoreLikeThisCubit(
        ServiceLocator.getIt.get<GetMoreLikeThisUseCase>(),
      )..getMoreLikeThis(movieName: movie.title),
      child: Scaffold(
        backgroundColor: AppColors.darkPurple,
        body: DetailsViewBody(
          movie: movie,
        ),
      ),
    );
  }
}
