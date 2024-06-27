import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/entities/base_movie_entity.dart';
import 'package:task_2/core/view_model/git_more_like_this_cubit.dart/get_more_like_this_cubit.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/custom_page_view.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/custom_tap_bar.dart';

class CusttomTapBarSection extends StatefulWidget {
  const CusttomTapBarSection({super.key, required this.baseMovieEntity});
  final BaseMovieEntity baseMovieEntity;

  @override
  State<CusttomTapBarSection> createState() => _CusttomTapBarSectionState();
}

class _CusttomTapBarSectionState extends State<CusttomTapBarSection> {
  late PageController controller;
  int currentPage = 0;
  @override
  void initState() {
    controller = PageController();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.round();
      });
    });
    BlocProvider.of<GetMoreLikeThisCubit>(context)
        .getMoreLikeThis(movieName: widget.baseMovieEntity.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTapBar(
          pageController: controller,
          currentPage: currentPage,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomExpandablePageView(
          controller: controller,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
