import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/on_the_air_bloc_builder.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/tv_popular_section.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/tv_top_rated_section.dart';
import 'package:task_2/modules/tv/presentation/view_model/get_on_the_air_cubit/get_on_the_air_cubit.dart';
import 'package:task_2/modules/tv/presentation/view_model/get_tv_popular_cubit/get_tv_popular_cubit_cubit.dart';
import 'package:task_2/modules/tv/presentation/view_model/get_tv_top_rated.dart/get_tv_top_rated_cubit.dart';

class TvView extends StatefulWidget {
  const TvView({super.key});

  @override
  State<TvView> createState() => _TvViewState();
}

class _TvViewState extends State<TvView> {
  @override
  void initState() {
    BlocProvider.of<GetOnTheAirCubit>(context).getOnTheAir();
    BlocProvider.of<GetTvPopularCubitCubit>(context).getTvPopular();
    BlocProvider.of<GetTvTopRatedCubit>(context).getTopRatedTv();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: OnTheAirBlocBuilder()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: TvPopularSection(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 15,
          ),
        ),
        SliverToBoxAdapter(
          child: TvTopRatedSection(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 15,
          ),
        ),
      ],
    );
  }
}
