import 'package:calculator_ion_mobility/module/main/bloc/main_bloc.dart';
import 'package:calculator_ion_mobility/module/main/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('displays initial input and result', (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => MainBloc(),
        child: const MaterialApp(home: MainPage()),
      ),
    );

    expect(find.text('0'), findsNWidgets(2));
  });

  testWidgets('updates input and result when buttons are pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => MainBloc(),
        child: const MaterialApp(home: MainPage()),
      ),
    );

    await tester.tap(find.text('1'));
    await tester.tap(find.text('+'));
    await tester.tap(find.text('1'));
    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.text('1+1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('displays history correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => MainBloc(),
        child: const MaterialApp(home: MainPage()),
      ),
    );

    await tester.tap(find.text('2'));
    await tester.tap(find.text('+'));
    await tester.tap(find.text('3'));
    await tester.tap(find.text('='));
    await tester.pump();

    await tester.tap(find.text('4'));
    await tester.tap(find.text('*'));
    await tester.tap(find.text('2'));
    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.text('2+3 = 5'), findsOneWidget);
    expect(find.text('4*2 = 8'), findsOneWidget);
  });
}
