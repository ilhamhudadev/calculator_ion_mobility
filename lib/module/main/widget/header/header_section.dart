import 'package:calculator_ion_mobility/core/style/app_size.dart';
import 'package:calculator_ion_mobility/core/style/app_typography.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    DateTime now = DateTime.now();
    int hour = now.hour;
    var value = "";
    if (hour >= 4 && hour < 10) {
      value = 'good morning';
    } else if (hour >= 10 && hour < 17) {
      value = 'good afternoon';
    } else if (hour >= 17 && hour < 21) {
      value = 'good evening';
    } else {
      value = 'good night';
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          width: AppSize.screenWidth * 0.2,
          child: Text(
            value,
            maxLines: 2,
            textAlign: TextAlign.end,
            style: AppTypography.body2(color: Colors.white),
          )),
      Text(
        " | Let's Calc.",
        style: AppTypography.headline5(color: Colors.white),
      ),
    ]);
  }
}
