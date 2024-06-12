import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  dynamic value;
  GestureTapCallback? onPress;
  Color? color;
  IconData? icon;

  DefaultButton({Key? key, this.value, this.onPress, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress ?? () {},
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
          width: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color ?? Colors.transparent,
          ),
          child: Center(child: Icon(icon ?? Icons.abc))),
    );
  }
}
