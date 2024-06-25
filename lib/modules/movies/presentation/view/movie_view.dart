import 'package:flutter/material.dart';
import 'package:task_2/modules/movies/presentation/view/widgets/movie_view_body.dart';

class MovieView extends StatelessWidget {
  static const routeName = '/movie-view';
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MovieViewBody();
  }
}
