import 'package:calculator_ion_mobility/core/style/app_size.dart';
import 'package:calculator_ion_mobility/core/style/app_typography.dart';
import 'package:calculator_ion_mobility/module/main/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerHistory extends StatelessWidget {
  const DrawerHistory({Key? key, this.html, this.title}) : super(key: key);

  final String? html;
  final String? title;
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("History",
                      style: AppTypography.headline5(color: Colors.black)),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                      ))
                ],
              ),
              Text("Your Calculation Log",
                  style: AppTypography.body2(color: Colors.black)),
              const Divider(),
              SizedBox(
                  child: state.history.isEmpty
                      ? Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Text("You didn't execute any calculations.",
                              style: AppTypography.body2(color: Colors.black)),
                        )
                      : SizedBox(
                          height: AppSize.screenHeight * 0.7,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: state.history.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Text(
                                  "[${index + 1}]",
                                  style:
                                      AppTypography.body2(color: Colors.black),
                                ),
                                title: Text(
                                  state.history[index],
                                  style:
                                      AppTypography.body2(color: Colors.black),
                                ),
                              );
                            },
                          ),
                        )),
            ],
          ));
    });
  }
}
