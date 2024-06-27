import 'package:flutter/material.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/details_tab_bar_item.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar({
    super.key,
    required this.currentPage,
    required this.pageController,
  });
  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(2, (index) {
          return GestureDetector(
            onTap: () {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            child: TabBarItem(
              isActive: index == currentPage,
              title: 'EPISODES',
            ),
          );
        }));
  }
}
