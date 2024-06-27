import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_2/bottom_nav_bar.dart';
import 'package:task_2/core/theme/app_colors.dart';

class SplashView extends StatefulWidget {
  static const routeName = "splash";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigateToHome();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black,
        body: Center(
          child: Lottie.asset('assets/lottie/splash.json'),
        ));
  }

  void navigateToHome() {
    Future.delayed(const Duration(milliseconds: 2750), () {
      Navigator.pushReplacementNamed(
          context, CustomBottomNavigationBar.routeName);
    });
  }
}
