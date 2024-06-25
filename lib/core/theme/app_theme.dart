import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';

abstract class AppTheme {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBlack,
    brightness: Brightness.dark,
  );
}
