import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/widgets/custom_err_widget.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/on_the_air_section.dart';
import 'package:task_2/modules/tv/presentation/view_model/get_on_the_air_cubit/get_on_the_air_cubit.dart';

import '../../../../../core/widgets/fading_loading_image.dart';

class OnTheAirBlocBuilder extends StatelessWidget {
  const OnTheAirBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOnTheAirCubit, GetOnTheAirState>(
        builder: (context, state) {
      if (state is GetOnTheAirSuccess) {
        return OnTheAirSection(tv: state.movie);
      } else if (state is GetOnTheAirFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const FadinImageLoading();
      }
    });
  }
}
