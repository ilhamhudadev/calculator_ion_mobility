import 'package:calculator_ion_mobility/module/main/bloc/main_bloc.dart';
import 'package:calculator_ion_mobility/module/main/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('displays initial input and result', (WidgetTester tester) async {
    // Pump the widget tree
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => MainBloc(), // Create a MainBloc instance
        child: const MaterialApp(home: MainPage()), // Build the MainPage widget
      ),
    );

    // Verify if '0' is displayed twice (for initial input and result)
    expect(find.text('0'), findsNWidgets(2));
  });

  // Test to check if input and result are updated correctly when buttons are pressed
  testWidgets('updates input and result when buttons are pressed',
      (WidgetTester tester) async {
    // Pump the widget tree
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => MainBloc(), // Create a MainBloc instance
        child: const MaterialApp(home: MainPage()), // Build the MainPage widget
      ),
    );

    // Simulate button presses
    await tester.tap(find.text('1'));
    await tester.tap(find.text('+'));
    await tester.tap(find.text('1'));
    await tester.tap(find.text('='));
    await tester.pump();

    // Verify if input expression '1+1' and result '2' are displayed
    expect(find.text('1+1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });

  // Test to check if history is displayed correctly
  testWidgets('displays history correctly', (WidgetTester tester) async {
    // Pump the widget tree
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => MainBloc(), // Create a MainBloc instance
        child: const MaterialApp(home: MainPage()), // Build the MainPage widget
      ),
    );

    // Simulate button presses for two calculations
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

    // Verify if history entries are displayed correctly
    expect(find.text('2+3 = 5'), findsOneWidget);
    expect(find.text('4*2 = 8'), findsOneWidget);
  });
}
