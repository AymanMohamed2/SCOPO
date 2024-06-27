import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:task_2/core/widgets/more_like_this_details_bloc_builder.dart';
import 'package:task_2/core/widgets/no_data_widget.dart';

class CustomExpandablePageView extends StatelessWidget {
  const CustomExpandablePageView({
    super.key,
    required this.controller,
  });

  final PageController controller;
  static const List<Widget> pageViewItems = [
    NoDataWidget(),
    CustomScrollView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      slivers: [MoreLikeThisBlocBuilder()],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
        controller: controller,
        itemCount: 2,
        itemBuilder: (context, index) {
          return pageViewItems[index];
        });
  }
}
