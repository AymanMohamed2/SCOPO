import 'package:flutter/material.dart';

class MovieAspectRatio extends StatelessWidget {
  const MovieAspectRatio({
    super.key,
    this.aspectRatio,
  });

  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: aspectRatio ?? 1,
        child: Container(
          color: Colors.grey,
        ));
  }
}
