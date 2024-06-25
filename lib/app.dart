import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/bottom_nav_bar.dart';
import 'package:task_2/core/helper/on_generate_route.dart';
import 'package:task_2/core/theme/app_theme.dart';
import 'package:task_2/core/utils/app_strings.dart';
import 'package:task_2/core/utils/service_locator.dart';
import 'package:task_2/modules/movies/domain/usecases/now_playing_movies_usecase.dart';
import 'package:task_2/modules/movies/domain/usecases/popular_movies_usecase.dart';
import 'package:task_2/modules/movies/domain/usecases/top_rated_movies_usecase.dart';
import 'package:task_2/modules/movies/presentation/view_model/get_popular_cubit/get_popular_cubit.dart';
import 'package:task_2/modules/movies/presentation/view_model/get_top_rated_cubit/get_top_rated_cubit.dart';
import 'package:task_2/modules/movies/presentation/view_model/now_playing_cubit/now_playing_cubit.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NowPlayingCubit(
            ServiceLocator.getIt.get<NowPlayingMoviesUseCase>(),
          )..getNowPlayingMovies(),
        ),
        BlocProvider(
          create: (context) => GetPopularCubit(
            ServiceLocator.getIt.get<PopularMoviesUseCase>(),
          )..getPopularMovies(),
        ),
        BlocProvider(
          create: (context) => GetTopRatedCubit(
            ServiceLocator.getIt.get<TopRatedMoviesUseCase>(),
          )..getTopRatedMovies(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.theme,
        title: AppStrings.movieApp,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: BottomNavigationBarExample.routeName,
      ),
    );
  }
}
