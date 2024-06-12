import 'package:calculator_ion_mobility/module/main/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_ion_mobility/module/main/bloc/main_bloc.dart';
import 'package:calculator_ion_mobility/module/main/widget/button/action_button.dart';
import 'package:calculator_ion_mobility/module/main/widget/button/number_button.dart';
import 'package:calculator_ion_mobility/module/main/widget/header/header_section.dart';
import 'package:calculator_ion_mobility/module/main/widget/result/result_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  group('MainPage Widget Test', () {
    late MainBloc mainBloc;

    setUp(() {
      mainBloc = MainBloc();
    });

    testWidgets('renders MainPage and interacts with widgets',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<MainBloc>(
            create: (_) => mainBloc,
            child: const MainPage(),
          ),
        ),
      );

      // Verify the presence of HeaderSection
      expect(find.byType(HeaderSection), findsOneWidget);

      // Verify the presence of ResultSection
      expect(find.byType(ResultSection), findsOneWidget);

      // Verify the presence of NumberButtons (1, 2, 3)
      expect(find.widgetWithText(NumberButton, '1'), findsOneWidget);
      expect(find.widgetWithText(NumberButton, '2'), findsOneWidget);
      expect(find.widgetWithText(NumberButton, '3'), findsOneWidget);

      // Tap number buttons and verify interaction
      await tester.tap(find.widgetWithText(NumberButton, '1'));
      await tester.tap(find.widgetWithText(NumberButton, '2'));
      await tester.tap(find.widgetWithText(NumberButton, '3'));
      await tester.pump();

      // Tap ActionButton for 'history_outlined' and open drawer
      await tester.tap(find.byIcon(Icons.history_outlined));
      await tester.pump();

      // Verify if Drawer is opened
      expect(find.byType(Drawer), findsOneWidget);

      // Close the drawer
      await tester.dragFrom(const Offset(300, 300), const Offset(-300, 0));
      await tester.pump();

      // Tap ActionButton for 'backspace'
      await tester.tap(find.byIcon(Icons.backspace));
      await tester.pump();

      // Tap ActionButton for '='
      await tester.tap(find.widgetWithText(ActionButton, '='));
      await tester.pump();

      // Tap ActionButton for 'C' (Clear)
      await tester.tap(find.widgetWithText(ActionButton, 'C'));
      await tester.pump();

      // Tap arithmetic operator buttons
      await tester.tap(find.widgetWithText(ActionButton, '\u00F7'));
      await tester.tap(find.widgetWithText(ActionButton, '-'));
      await tester.tap(find.widgetWithText(ActionButton, 'x'));
      await tester.tap(find.widgetWithText(ActionButton, '+'));
      await tester.pump(); // Rebuild the widget after the state has changed
    });

    tearDown(() {
      mainBloc.close();
    });
  });
}
