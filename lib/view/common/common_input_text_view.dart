import 'package:flutter/material.dart';
import 'package:math_riddle/core/app_colors.dart';

class CommonInputTextView extends StatelessWidget {
  final String value;
  final double height;

  const CommonInputTextView({
    required this.value,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.blackLight,
      constraints: BoxConstraints.expand(height: height),
      alignment: Alignment.center,
      child: Text(
        value,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
