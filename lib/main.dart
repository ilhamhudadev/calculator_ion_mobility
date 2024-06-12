import 'package:calculator_ion_mobility/module/main/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'module/main/pages/main_page.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider<MainBloc>(create: (_) => MainBloc())],
      child: const MainScreen()));
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
