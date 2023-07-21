import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math_riddle/core/app_colors.dart';
import 'package:math_riddle/view/neopop_button/constants.dart';
import 'package:math_riddle/view/neopop_button/neopop_button_translator.dart';

class CommonFilledButtonView extends StatelessWidget {
  final String label;
  final bool isSelected;
  final void Function(String) onPressed;
  final double height;
  final FontWeight fontWeight;
  final double fontSize;

  const CommonFilledButtonView({
    required this.label,
    required this.onPressed,
    required this.height,
    this.isSelected = false,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 20,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: NeoPopButtonTranslator(
        onPressed: () {
          onPressed(label);
        },
        depth: kSmallButtonDepth,
        child: Container(
          color: isSelected ? AppColor.blue : AppColor.white,
          constraints: BoxConstraints.expand(height: height),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: isSelected ? AppColor.white : AppColor.black,
            ),
          ),
        ),
      ),
    );
  }
}

class CommonFilledEnterButtonView extends StatelessWidget {
  final void Function() onPressed;
  final double height;

  const CommonFilledEnterButtonView({
    required this.onPressed,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: NeoPopButtonTranslator(
        onPressed: onPressed,
        depth: kSmallButtonDepth,
        child: Container(
          color: AppColor.green,
          constraints: BoxConstraints.expand(height: height),
          alignment: Alignment.center,
          child: Text(
            "enter".tr(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CommonFilledBackButtonView extends StatelessWidget {
  final void Function() onPressed;
  final double height;

  const CommonFilledBackButtonView({
    required this.onPressed,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: NeoPopButtonTranslator(
        onPressed: onPressed,
        depth: kSmallButtonDepth,
        child: Container(
          color: AppColor.red,
          constraints: BoxConstraints.expand(height: height),
          alignment: Alignment.center,
          child: const Icon(
            Icons.backspace_outlined,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
