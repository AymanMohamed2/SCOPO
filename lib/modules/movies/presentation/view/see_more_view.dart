import 'package:flutter/material.dart';
import 'package:task_2/core/helper/build_app_bar.dart';
import 'package:task_2/core/helper/see_more_arguments.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/see_more_view_body.dart';

class SeeMoreView extends StatelessWidget {
  static const String routeName = '/seeMoreView';
  const SeeMoreView({super.key, required this.arguments});
  final SeeMoreArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      appBar: buildAppBar(context, title: arguments.appbarTitle),
      body: SeeMoreViewBody(
        movieType: arguments.movieType,
      ),
    );
  }
}
