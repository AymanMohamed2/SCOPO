import 'package:flutter/material.dart';
import 'package:task_2/core/utils/styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.getRegular23(context),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              'See More >',
              style: AppStyles.getRegular16(context),
            ),
          ),
        ],
      ),
    );
  }
}
