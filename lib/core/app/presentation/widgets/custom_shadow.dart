import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';

class CustomShadow extends StatelessWidget {
  const CustomShadow({
    super.key,
    required this.backChild,
    this.frontChild,
  });
  final Widget backChild;
  final Widget? frontChild;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            backChild,
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.lightBlack,
                    AppColors.transparent,
                  ],
                ),
              ),
              child: frontChild,
            ),
          ],
        ));
  }
}
