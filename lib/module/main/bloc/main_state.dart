part of 'main_bloc.dart';

class MainState {
  final String input;
  final String result;
  final List<String> history;

  const MainState({
    this.input = "0",
    this.result = "0",
    this.history = const [''],
  });

  MainState copyWith({
    required String input,
    required String result,
    required List<String> history,
  }) {
    return MainState(
      input: input,
      result: result,
      history: history,
    );
  }

  List<Object> get props => [
        input,
        result,
        history,
      ];
}

class MainInitial extends MainState {
  MainInitial()
      : super(
          input: "",
          result: "0",
          history: [],
        );
}
