import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_2/core/theme/assets.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(Assets.noData),
    );
  }
}
