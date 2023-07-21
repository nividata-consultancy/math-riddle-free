import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:math_riddle/data/rating/rate_us_controller.dart';
import 'package:math_riddle/view/common/common_filled_label_button_view.dart';
import 'package:math_riddle/view/common/common_text_button_view.dart';
import 'package:math_riddle/view/neopop_button/constants.dart';
import 'package:provider/provider.dart';

class RateUsScreen extends StatelessWidget {
  const RateUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RateUsController rateUsController = context.read<RateUsController>();

    return Material(
      color: const Color.fromARGB(96, 12, 12, 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: const Color(0xff212121),
            alignment: Alignment.center,
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Rate Us',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto",
                  ),
                ),
                const SizedBox(height: 14),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Thank you for playing our puzzle game!  We would greatly appreciate it if you could take a moment to rate our game.\nYour support means a lot to us. Happy puzzling!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CommonFilledLabelButtonView(
                    depth: kMediumButtonDepth,
                    label: "Rate".toUpperCase(),
                    height: 42,
                    fontSize: 16,
                    onPressed: () {
                      rateUsController.setRated();
                      GoRouter.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CommonTextButtonView(
                    label: "Later".toUpperCase(),
                    height: 42,
                    fontWeight: FontWeight.w700,
                    onPressed: () {
                      if (rateUsController.isRemindMeLater) {
                        rateUsController.set2ndTimeRemindMeLater();
                      } else {
                        rateUsController.setRemindMeLater();
                      }
                      GoRouter.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}