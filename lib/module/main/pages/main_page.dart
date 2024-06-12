import 'package:calculator_ion_mobility/module/main/bloc/main_bloc.dart';
import 'package:calculator_ion_mobility/module/main/widget/button/action_button.dart';
import 'package:calculator_ion_mobility/module/main/widget/button/number_button.dart';
import 'package:calculator_ion_mobility/module/main/widget/drawer/drawer_history.dart';
import 'package:calculator_ion_mobility/module/main/widget/header/header_section.dart';
import 'package:calculator_ion_mobility/module/main/widget/result/result_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final mainbloc = BlocProvider.of<MainBloc>(context);

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black45,
            title: const HeaderSection()),
        drawer: const Drawer(child: DrawerHistory()),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const ResultSection(),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              sectionNumber(1, 2, 3),
              Builder(
                builder: (context) {
                  return ActionButton(
                    backgroundcolor: Colors.grey[700],
                    icon: Icons.history_outlined,
                    onPress: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            ]),
            const SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              sectionNumber(4, 5, 6),
              ActionButton(
                backgroundcolor: Colors.grey[700],
                icon: Icons.backspace,
                onPress: () => mainbloc.add(const MainButtonPressed("BACK")),
              ),
            ]),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    sectionNumber(7, 8, 9),
                    const SizedBox(
                      height: 5,
                    ),
                    sectionNumberPoint(mainbloc),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                ActionButton(
                  height: 130,
                  title: "=",
                  onPress: () => mainbloc.add(const MainButtonPressed("=")),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(),
            ),
            sectionCalculate(mainbloc)
          ],
        ));
  }

  Widget sectionNumber(value1, value2, value3) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        NumberButton(value: value1),
        const SizedBox(
          width: 5,
        ),
        NumberButton(value: value2),
        const SizedBox(
          width: 5,
        ),
        NumberButton(value: value3),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget sectionNumberPoint(mainbloc) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        ActionButton(
          title: "C",
          onPress: () => mainbloc.add(const MainButtonPressed("CLEAR")),
        ),
        const SizedBox(
          width: 5,
        ),
        NumberButton(value: 0),
        const SizedBox(
          width: 5,
        ),
        NumberButton(value: "."),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget sectionCalculate(mainbloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ActionButton(
              onPress: () => mainbloc.add(const MainButtonPressed("/")),
              title: '\u00F7',
              backgroundcolor: Colors.transparent,
              titleColor: Colors.white,
            )),
        ActionButton(
          onPress: () => mainbloc.add(const MainButtonPressed("-")),
          title: '-',
          backgroundcolor: Colors.transparent,
          titleColor: Colors.white,
        ),
        ActionButton(
          onPress: () => mainbloc.add(const MainButtonPressed("x")),
          title: 'x',
          backgroundcolor: Colors.transparent,
          titleColor: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ActionButton(
            onPress: () => mainbloc.add(const MainButtonPressed("+")),
            title: '+',
            backgroundcolor: Colors.transparent,
            titleColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
