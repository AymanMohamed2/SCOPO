import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.primary,
        size: 20,
      ),
    ),
    backgroundColor: Colors.black.withOpacity(0.3),
    centerTitle: true,
    title: Text(title),
  );
}
