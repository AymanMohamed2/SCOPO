import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/core/widgets/movie_image_item.dart';
import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';
import 'package:task_2/modules/tv/presentation/view_model/get_tv_popular_cubit/get_tv_popular_cubit_cubit.dart';

class TvPopularListView extends StatefulWidget {
  const TvPopularListView({
    super.key,
    required this.tvs,
  });
  final List<TvEntity> tvs;

  @override
  State<TvPopularListView> createState() => _TvPopularListViewState();
}

class _TvPopularListViewState extends State<TvPopularListView> {
  late final ScrollController _scrollController;

  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<GetTvPopularCubitCubit>(context).getTvPopular(
            pageNumber:
                ++BlocProvider.of<GetTvPopularCubitCubit>(context).nextPage);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.tvs.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 5),
          child: GestureDetector(
            onTap: () {},
            child: MovieImageItem(
              image: widget.tvs[index].image,
            ),
          ),
        ),
      ),
    );
  }
}
