import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/app/domain/entities/base_movie_entity.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/core/app/presentation/view_model/git_more_like_this_cubit.dart/get_more_like_this_cubit.dart';
import 'package:task_2/core/app/presentation/widgets/more_details_view_body.dart';

class MovieDetailsView extends StatefulWidget {
  static const String routeName = '/details_view';
  const MovieDetailsView({super.key, required this.baseMovieEntity});
  final BaseMovieEntity baseMovieEntity;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    BlocProvider.of<GetMoreLikeThisCubit>(context)
        .getMoreLikeThis(movieName: widget.baseMovieEntity.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: DetailsViewBody(
        baseMovieEntity: widget.baseMovieEntity,
      ),
    );
  }
}
