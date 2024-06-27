import 'package:flutter/material.dart';
import 'package:task_2/core/entities/base_movie_entity.dart';
import 'package:task_2/core/widgets/movie_image_item.dart';
import 'package:task_2/modules/movies/presentation/view/movie_details_view.dart';

class CustomHomeListView extends StatefulWidget {
  const CustomHomeListView({
    super.key,
    required this.baseMovieEntity,
    required this.onPaginationScroll,
    this.onTap,
  });
  final List<BaseMovieEntity> baseMovieEntity;

  final Future<void> Function() onPaginationScroll;
  final void Function(int)? onTap;

  @override
  State<CustomHomeListView> createState() => _CustomHomeListViewState();
}

class _CustomHomeListViewState extends State<CustomHomeListView> {
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
    return SizedBox(
      height: 160,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.baseMovieEntity.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 5),
          child: GestureDetector(
            onTap: () {
              if (widget.onTap == null) {
                Navigator.pushNamed(context, MovieDetailsView.routeName,
                    arguments: widget.baseMovieEntity[index]);
              } else {
                widget.onTap!.call(index);
              }
            },
            child: MovieImageItem(
              image: widget.baseMovieEntity[index].image,
            ),
          ),
        ),
      ),
    );
  }
}
