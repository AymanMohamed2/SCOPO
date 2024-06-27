import 'package:flutter/material.dart';
import 'package:task_2/bottom_nav_bar.dart';
import 'package:task_2/core/app/domain/entities/base_movie_entity.dart';
import 'package:task_2/core/helper/see_more_arguments.dart';
import 'package:task_2/modules/movies/presentation/view/movie_details_view.dart';
import 'package:task_2/modules/movies/presentation/view/movie_view.dart';
import 'package:task_2/modules/movies/presentation/view/see_more_view.dart';
import 'package:task_2/modules/tv/presentation/view/tv_details_view.dart';
import 'package:task_2/modules/tv/presentation/view/tv_see_more_view.dart';

import '../../modules/splash/presentation/view/splash_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case MovieView.routeName:
        return MaterialPageRoute(builder: (context) => const MovieView());
      case CustomBottomNavigationBar.routeName:
        return MaterialPageRoute(
            builder: (context) => const CustomBottomNavigationBar());
      case SeeMoreView.routeName:
        return MaterialPageRoute(
            builder: (context) => SeeMoreView(
                  arguments: settings.arguments as SeeMoreArguments,
                ));
      case MovieDetailsView.routeName:
        return MaterialPageRoute(
            builder: (context) => MovieDetailsView(
                  baseMovieEntity: settings.arguments as BaseMovieEntity,
                ));
      case TvSeeMoreView.routeName:
        return MaterialPageRoute(
            builder: (context) => TvSeeMoreView(
                  arguments: settings.arguments as SeeMoreArguments,
                ));
      case TvDetailsView.routeName:
        return MaterialPageRoute(
            builder: (context) => TvDetailsView(
                  baseMovieEntity: settings.arguments as BaseMovieEntity,
                ));
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
