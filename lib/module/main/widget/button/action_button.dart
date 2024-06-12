import 'package:calculator_ion_mobility/core/style/app_typography.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  GestureTapCallback? onPress;
  Color? backgroundcolor;
  double? height;
  double? width;
  IconData? icon;
  String? title;
  Color? iconColor;
  Color? titleColor;
  double? borderRadius;

  ActionButton(
      {Key? key,
      this.onPress,
      this.backgroundcolor,
      this.height,
      this.icon,
      this.width,
      this.iconColor,
      this.titleColor,
      this.borderRadius,
      this.title = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress ?? () {},
      splashColor: Colors.black38,
      borderRadius: BorderRadius.circular(borderRadius ?? 20),
      child: Container(
          margin: const EdgeInsets.all(10),
          height: height ?? 60,
          width: width ?? 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
            color: backgroundcolor ?? Colors.orange[400],
          ),
          child: Center(
              child: title!.isNotEmpty
                  ? Text(
                      "$title",
                      textAlign: TextAlign.center,
                      style: AppTypography.headline3(
                          color: titleColor ?? Colors.white),
                    )
                  : Icon(
                      icon ?? Icons.abc_rounded,
                      color: iconColor ?? Colors.white,
                    ))),
    );
  }
}
