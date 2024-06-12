import 'package:calculator_ion_mobility/core/style/app_typography.dart';
import 'package:calculator_ion_mobility/module/main/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberButton extends StatelessWidget {
  dynamic value;
  GestureTapCallback? onPress;
  Color? color;

  NumberButton({
    Key? key,
    this.value,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = BlocProvider.of<MainBloc>(context);

    return InkWell(
      onTap: () => mainBloc.add(MainButtonPressed("$value")),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: 70,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color ?? Colors.transparent,
        ),
        child: Text(
          "$value",
          textAlign: TextAlign.center,
          style: AppTypography.headline3(color: Colors.white),
        ),
      ),
    );
  }
}
