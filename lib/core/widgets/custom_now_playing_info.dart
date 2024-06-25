import 'package:flutter/material.dart';
import 'package:task_2/core/theme/app_colors.dart';

class NowPlayingInfo extends StatelessWidget {
  const NowPlayingInfo({super.key, this.title, required this.movieName});
  final String? title;
  final String movieName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                    color: AppColors.redColor, shape: BoxShape.circle),
              ),
              const SizedBox(width: 5),
              Text(title ?? 'Now Playing'),
            ],
          ),
          const SizedBox(height: 7),
          Text(movieName)
        ],
      ),
    );
  }
}
