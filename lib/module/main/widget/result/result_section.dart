import 'package:calculator_ion_mobility/core/style/app_typography.dart';
import 'package:calculator_ion_mobility/module/main/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultSection extends StatelessWidget {
  const ResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Column(children: [
          countSection(state.input),
          resultSection(state.result),
        ]);
      },
    );
  }

  Widget countSection(text) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Text(text, style: AppTypography.body2(color: Colors.white)),
    );
  }

  Widget resultSection(text) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total", style: AppTypography.body2(color: Colors.grey)),
          Text(text, style: AppTypography.headline5(color: Colors.white)),
        ],
      ),
    );
  }
}
