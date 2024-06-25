import 'package:flutter/material.dart';
import 'package:task_2/bottom_nav_bar.dart';
import 'package:task_2/core/helper/see_more_arguments.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/modules/movies/presentation/view/details_view.dart';
import 'package:task_2/modules/movies/presentation/view/movie_view.dart';
import 'package:task_2/modules/movies/presentation/view/see_more_view.dart';
import 'package:task_2/modules/tv/presentation/view/tv_see_more_view.dart';

import '../../modules/splash/presentation/view/splash_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case MovieView.routeName:
        return MaterialPageRoute(builder: (context) => const MovieView());
      case BottomNavigationBarExample.routeName:
        return MaterialPageRoute(
            builder: (context) => const BottomNavigationBarExample());
      case SeeMoreView.routeName:
        return MaterialPageRoute(
            builder: (context) => SeeMoreView(
                  arguments: settings.arguments as SeeMoreArguments,
                ));
      case DetailsView.routeName:
        return MaterialPageRoute(
            builder: (context) => DetailsView(
                  movie: settings.arguments as MoviesEntity,
                ));
      case TvSeeMoreView.routeName:
        return MaterialPageRoute(
            builder: (context) => TvSeeMoreView(
                  arguments: settings.arguments as SeeMoreArguments,
                ));
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
