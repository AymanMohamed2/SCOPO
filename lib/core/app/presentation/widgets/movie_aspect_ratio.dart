import 'package:flutter/material.dart';

class MovieAspectRatio extends StatelessWidget {
  const MovieAspectRatio({
    super.key,
    this.aspectRatio,
    this.child,
  });

  final double? aspectRatio;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: aspectRatio ?? 1,
        child: child ??
            Container(
              color: Colors.grey,
            ));
  }
}
