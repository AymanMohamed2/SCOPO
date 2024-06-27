import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/app/presentation/widgets/custom_err_widget.dart';
import 'package:task_2/core/app/presentation/widgets/see_more_list_view.dart';
import 'package:task_2/core/app/presentation/widgets/see_more_loading_list_view.dart';
import 'package:task_2/modules/tv/presentation/view/tv_details_view.dart';
import 'package:task_2/modules/tv/presentation/view_model/get_tv_top_rated.dart/get_tv_top_rated_cubit.dart';

class TvSeeMoreTopRatedBlocBuilder extends StatelessWidget {
  const TvSeeMoreTopRatedBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GetTvTopRatedCubit>(context);
    return BlocBuilder<GetTvTopRatedCubit, GetTvTopRatedState>(
      builder: (context, state) {
        if (state is GetTvTopRatedSuccess ||
            state is GetTvTopRatedPaginationFailure ||
            state is GetTvTopRatedPaginationLoading) {
          return SeeMoreListView(
            onTap: (index) {
              Navigator.popAndPushNamed(context, TvDetailsView.routeName,
                  arguments: cubit.tvs[index]);
            },
            onPaginationScroll: () async {
              await cubit.getTopRatedTv(pageNumber: ++cubit.nextPage);
            },
            baseMovieEntity: cubit.tvs,
          );
        } else if (state is GetTvTopRatedFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const SeeMoreLoadingListView();
        }
      },
    );
  }
}
