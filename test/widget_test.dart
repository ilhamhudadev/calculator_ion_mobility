// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calculator_ion_mobility/module/main/bloc/main_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('MainBloc', () {
    late MainBloc mainBloc;

    setUp(() {
      mainBloc = MainBloc();
    });

    tearDown(() {
      mainBloc.close();
    });

    test('initial state is MainInitial', () {
      expect(mainBloc.state, MainInitial());
    });

    blocTest<MainBloc, MainState>(
      'emits [MainState] with updated input when button is pressed',
      build: () => mainBloc,
      act: (bloc) => bloc.add(const MainButtonPressed('1')),
      expect: () => [const MainState(input: '1', result: '0', history: [])],
    );

    blocTest<MainBloc, MainState>(
      'emits [MainState] with result when = is pressed',
      build: () => mainBloc,
      act: (bloc) {
        bloc.add(const MainButtonPressed('1'));
        bloc.add(const MainButtonPressed('+'));
        bloc.add(const MainButtonPressed('1'));
        bloc.add(const MainButtonPressed('='));
      },
      expect: () => [
        const MainState(input: '1', result: '0', history: []),
        const MainState(input: '1+', result: '0', history: []),
        const MainState(input: '1+1', result: '0', history: []),
        const MainState(input: '1+1', result: '2', history: ['1+1 = 2']),
      ],
    );

    blocTest<MainBloc, MainState>(
      'emits [MainState] with input sanitized',
      build: () => mainBloc,
      act: (bloc) {
        bloc.add(const MainButtonPressed('0'));
        bloc.add(const MainButtonPressed('0'));
        bloc.add(const MainButtonPressed('1'));
      },
      expect: () => [
        const MainState(input: '0', result: '0', history: []),
        const MainState(input: '0', result: '0', history: []),
        const MainState(input: '1', result: '0', history: []),
      ],
    );
  });
}
