part of 'main_bloc.dart';

// class MainState {
//   final String mathResult;
//   final String firstNumbre;
//   final String secondNumber;
//   final String operation;
//   final String getGreetings;

//   const MainState(
//       {this.mathResult = '0',
//       this.firstNumbre = '0',
//       this.secondNumber = '0',
//       this.getGreetings = '',
//       this.operation = '+'});

//   MainState copyWith({
//     String? mathResult,
//     String? firstNumbre,
//     String? secondNumber,
//     String? getGreetings,
//     String? operation,
//   }) {
//     return MainState(
//         mathResult: mathResult ?? this.mathResult,
//         getGreetings: getGreetings ?? this.getGreetings,
//         firstNumbre: firstNumbre ?? this.firstNumbre,
//         secondNumber: secondNumber ?? this.secondNumber,
//         operation: operation ?? this.operation);
//   }
// }

class MainState {
  final String input;
  final String result;
  final List<String> history;
  // final String getGreetings;

  const MainState({
    this.input = "0",
    this.result = "0",
    this.history = const [''],
    // this.getGreetings = ""
  });

  MainState copyWith({
    required String input,
    required String result,
    required List<String> history,
  }) {
    return MainState(
      input: input,
      // getGreetings: getGreetings ?? this.getGreetings,
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
