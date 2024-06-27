import 'package:flutter/material.dart';
import 'package:task_2/core/entities/base_movie_entity.dart';
import 'package:task_2/core/widgets/see_more_item.dart';

class SeeMoreListView extends StatefulWidget {
  const SeeMoreListView(
      {super.key,
      required this.baseMovieEntity,
      required this.onPaginationScroll,
      this.onTap});
  final List<BaseMovieEntity> baseMovieEntity;

  final Future<void> Function() onPaginationScroll;
  final void Function(int)? onTap;

  @override
  State<SeeMoreListView> createState() => _SeeMoreListViewState();
}

class _SeeMoreListViewState extends State<SeeMoreListView> {
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
        await widget.onPaginationScroll.call();

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
    return ListView.builder(
        controller: _scrollController,
        itemCount: widget.baseMovieEntity.length,
        itemBuilder: (context, index) {
          return SeeMoreItem(
            onTap: () {
              widget.onTap!.call(index);
            },
            movie: widget.baseMovieEntity[index],
          );
        });
  }
}
