import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';
import 'package:task_2/core/utils/size_config.dart';

abstract class AppStyles {
  static TextStyle getRegular16(context) {
    return TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.normal,
        fontSize: getResponsiveFontSize(context, fontSize: 16));
  }

  static TextStyle getRegular23(context) {
    return TextStyle(
        color: AppColors.primary,
        fontSize: getResponsiveFontSize(context, fontSize: 23));
  }

  static TextStyle getBold20(context) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: getResponsiveFontSize(context, fontSize: 20));
  }

  static TextStyle getSemiBold20(context) {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: getResponsiveFontSize(context, fontSize: 20));
  }

  static TextStyle getBold30(context) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: getResponsiveFontSize(context, fontSize: 30));
  }

  static double getResponsiveFontSize(context, {required double fontSize}) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * .8;
    double upperLimit = fontSize * 1.2;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor(context) {
    // var dispatcher = PlatformDispatcher.instance;
    // var physicalWidth = dispatcher.views.first.physicalSize.width;
    // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
    // double width = physicalWidth / devicePixelRatio;

    double width = MediaQuery.sizeOf(context).width;
    if (width < SizeConfig.tablet) {
      return width / 550;
    } else if (width < SizeConfig.desktop) {
      return width / 1000;
    } else {
      return width / 1920;
    }
  }
}
