import 'package:flutter/material.dart';
import 'package:math_riddle/core/app_colors.dart';
import 'package:math_riddle/data/model/image_option.dart';
import 'package:math_riddle/view/common/custom_image_button_border.dart';
import 'package:math_riddle/view/neopop_button/constants.dart';
import 'package:math_riddle/view/neopop_button/neopop_button_translator.dart';

class CommonImageButtonView extends StatelessWidget {
  final ImageOption imageOption;
  final int index;
  final List<bool> selectedList;
  final void Function(ImageOption) onPressed;

  const CommonImageButtonView({
    required this.imageOption,
    required this.index,
    required this.selectedList,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: CustomImageButtonBorder(
          right: BorderSide(
            color: selectedList[index] ? AppColor.blue : Colors.white,
            width: selectedList[index] ? 2 : 1,
          ),
          top: BorderSide(
            color: selectedList[index] ? AppColor.blue : Colors.white,
            width: selectedList[index] ? 2 : 1,
          ),
          bottom: BorderSide(
            color: selectedList[index] ? AppColor.blue : Colors.white,
            width: selectedList[index] ? 2 : 1,
          ),
          left: BorderSide(
            color: getLeftBorderColor(),
            width: selectedList[index] ? 2 : 1,
          ),
        ),
      ),
      padding: const EdgeInsets.all(0.5),
      child: NeoPopButtonTranslator(
        onPressed: () {
          onPressed(imageOption);
        },
        depth: kSmallButtonDepth,
        child: Image.asset(
          imageOption.image,
        ),
      ),
    );
  }

  Color getLeftBorderColor() {
    if (selectedList[0]) {
      if (index == 0) {
        return AppColor.blue;
      } else if (index == 1) {
        return Colors.transparent;
      } else {
        return AppColor.white;
      }
    } else if (selectedList[1]) {
      if (index == 1) {
        return AppColor.blue;
      } else if (index == 2) {
        return Colors.transparent;
      } else {
        return AppColor.white;
      }
    } else if (selectedList[2]) {
      if (index == 2) {
        return AppColor.blue;
      } else if (index == 3) {
        return Colors.transparent;
      } else {
        return AppColor.white;
      }
    } else if (selectedList[3]) {
      if (index == 3) {
        return AppColor.blue;
      } else {
        return AppColor.white;
      }
    } else {
      return AppColor.white;
    }
  }
}
