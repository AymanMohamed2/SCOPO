import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({super.key, required this.title, this.isActive = false});
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: isActive ? Colors.red : AppColors.darkPurple,
          height: 4,
          width: isActive ? MediaQuery.of(context).size.width / 2 : 0,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              title,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
