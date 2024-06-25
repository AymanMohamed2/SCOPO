import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';
import 'package:task_2/modules/tv/presentation/view/widgets/see_more_tv_item.dart';
import 'package:task_2/modules/tv/presentation/view_model/get_tv_top_rated.dart/get_tv_top_rated_cubit.dart';

class TvSeeMoreTopRatedListView extends StatefulWidget {
  const TvSeeMoreTopRatedListView({super.key, required this.tvs});
  final List<TvEntity> tvs;

  @override
  State<TvSeeMoreTopRatedListView> createState() =>
      _TvSeeMoreTopRatedListViewState();
}

class _TvSeeMoreTopRatedListViewState extends State<TvSeeMoreTopRatedListView> {
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
        await BlocProvider.of<GetTvTopRatedCubit>(context).getTopRatedTv(
            pageNumber:
                ++BlocProvider.of<GetTvTopRatedCubit>(context).nextPage);
        isLoading = false;
        setState(() {});
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
    return ListView.builder(
        controller: _scrollController,
        itemCount: widget.tvs.length,
        itemBuilder: (context, index) {
          return SeeMoreTvItem(
            tv: widget.tvs[index],
          );
        });
  }
}
