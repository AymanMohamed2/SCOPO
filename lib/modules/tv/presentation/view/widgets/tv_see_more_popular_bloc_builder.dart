import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/widgets/custom_err_widget.dart';
import 'package:task_2/core/widgets/see_more_list_view.dart';
import 'package:task_2/core/widgets/see_more_loading_list_view.dart';
import 'package:task_2/modules/tv/presentation/view/tv_details_view.dart';
import 'package:task_2/modules/tv/presentation/view_model/get_tv_popular_cubit/get_tv_popular_cubit_cubit.dart';

class TvSeeMorePopularBlocBuilder extends StatelessWidget {
  const TvSeeMorePopularBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GetTvPopularCubitCubit>(context);
    return BlocBuilder<GetTvPopularCubitCubit, GetTvPopularState>(
      builder: (context, state) {
        if (state is GetTvPopularSuccess ||
            state is GetTvPopularPaginationFailure ||
            state is GetTvPopularPaginationLoading) {
          return SeeMoreListView(
            onTap: (index) {
              Navigator.popAndPushNamed(context, TvDetailsView.routeName,
                  arguments: cubit.tvs[index]);
            },
            onPaginationScroll: () async {
              await cubit.getTvPopular(pageNumber: ++cubit.nextPage);
            },
            baseMovieEntity: cubit.tvs,
          );
        } else if (state is GetTvPopularFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const SeeMoreLoadingListView();
        }
      },
    );
  }
}
