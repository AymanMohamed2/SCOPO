import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.error,
          color: AppColors.redColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(errMessage),
      ],
    );
  }
}
