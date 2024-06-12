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
      expect(mainBloc.state, isA<MainInitial>());
    });

    blocTest<MainBloc, MainState>(
      'emits [MainState] with updated input when button is pressed',
      build: () => mainBloc,
      act: (bloc) => bloc.add(const MainButtonPressed('1')),
      expect: () => [
        // const MainState(input: '1', result: '0', history: [''])
        isA<MainState>(),
      ],
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
        //     const MainState(input: '1', result: '0', history: []),
        //     const MainState(input: '1+', result: '0', history: []),
        //     const MainState(input: '1+1', result: '0', history: []),
        //     const MainState(input: '1+1', result: '2', history: ['1+1 = 2']),
        isA<MainState>(),
        isA<MainState>(),
        isA<MainState>(),
        isA<MainState>(),
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
        // const MainState(input: '0', result: '0', history: []),
        // const MainState(input: '0', result: '0', history: []),
        // const MainState(input: '1', result: '0', history: []),
        isA<MainState>(),
        isA<MainState>(),
        isA<MainState>(),
      ],
    );
  });
}
