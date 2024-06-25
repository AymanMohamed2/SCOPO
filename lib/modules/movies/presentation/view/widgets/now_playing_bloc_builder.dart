import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/widgets/custom_err_widget.dart';
import 'package:task_2/core/widgets/fading_loading_image.dart';
import 'package:task_2/core/widgets/now_playing.dart';
import 'package:task_2/modules/movies/presentation/view_model/now_playing_cubit/now_playing_cubit.dart';
import 'package:task_2/modules/movies/presentation/view_model/now_playing_cubit/now_playing_state.dart';

class NowPlayingBlocBuilder extends StatelessWidget {
  const NowPlayingBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
        builder: (context, state) {
      if (state is NowPlayingSuccess) {
        return NowPlayingSection(
          moviesEntity: state.movies[0],
        );
      } else if (state is NowPlayingFailure) {
        return CustomErrorWidget(
          errMessage: state.errMessage,
        );
      } else {
        return const FadinImageLoading();
      }
    });
  }
}
