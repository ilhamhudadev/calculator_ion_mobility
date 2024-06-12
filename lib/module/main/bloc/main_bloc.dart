import 'package:bloc/bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainButtonPressed>(onButtonPressed); // Define event handlers
  }

  // [MDIR:onButtonPressed] Handle button pressed event
  void onButtonPressed(MainButtonPressed event, Emitter<MainState> emit) {
    // Handle different button actions
    if (event.buttonText == "CLEAR") {
      emit(MainInitial());
    } else if (event.buttonText == "BACK") {
      // Handle back button press
      if (state.input.isNotEmpty) {
        emit(MainState(
            input: state.input.substring(0, state.input.length - 1),
            result: state.result,
            history: state.history));
      }
    } else if (event.buttonText == "=") {
      // Handle equal button press
      if (state.input.isNotEmpty) {
        try {
          final exp = state.input.replaceAll('x', '*');
          double res = evaluateExpression(exp);
          String formattedResult = formatResult(res);
          emit(MainState(
              input: formattedResult,
              result: formattedResult,
              history: List.from(state.history)
                ..add("${state.input} = $formattedResult")));
        } catch (e) {
          // Handle exception
          emit(MainState(
              input: "Please type the correct calculation",
              result: "0",
              history: state.history));
        }
      }
    } else {
      // Handle other button presses
      emit(MainState(
          input: sanitizeInput(state.input + event.buttonText),
          result: state.result,
          history: state.history));
    }
  }

  // [MDIR:sanitizeInput] Sanitize input by removing leading zeros
  String sanitizeInput(String input) {
    input = input.replaceAll(RegExp(r'^0+'), '');
    if (input.isEmpty) return '0';
    return input;
  }

  // [MDIR:evaluateExpression] Evaluate arithmetic expression
  double evaluateExpression(String expression) {
    List<String> tokens = tokenize(expression);
    List<String> rpn = toRPN(tokens);
    return evaluateRPN(rpn);
  }

  // [MDIR:formatResult] Format result with at most 5 decimal places
  String formatResult(double result) {
    String resultString = result.toStringAsFixed(5);
    resultString = resultString.replaceAll(RegExp(r'0+$'), '');
    if (resultString.endsWith('.')) {
      resultString = resultString.substring(0, resultString.length - 1);
    }
    return resultString;
  }

  // [MDIR:tokenize] Tokenize arithmetic expression
  List<String> tokenize(String expression) {
    List<String> tokens = [];
    String number = '';

    for (int i = 0; i < expression.length; i++) {
      String char = expression[i];

      if ('0123456789.'.contains(char)) {
        number += char;
      } else {
        if (number.isNotEmpty) {
          tokens.add(number);
          number = '';
        }
        tokens.add(char);
      }
    }

    if (number.isNotEmpty) {
      tokens.add(number);
    }

    return tokens;
  }

  // [MDIR:toRPN] Convert infix notation to Reverse Polish Notation
  List<String> toRPN(List<String> tokens) {
    List<String> output = [];
    List<String> operators = [];
    Map<String, int> precedence = {
      '+': 1,
      '-': 1,
      '*': 2,
      '/': 2,
    };

    for (String token in tokens) {
      if (isNumeric(token)) {
        output.add(token);
      } else if (token == '(') {
        operators.add(token);
      } else if (token == ')') {
        while (operators.isNotEmpty && operators.last != '(') {
          output.add(operators.removeLast());
        }
        operators.removeLast();
      } else {
        while (operators.isNotEmpty &&
            precedence[operators.last] != null &&
            precedence[operators.last]! >= precedence[token]!) {
          output.add(operators.removeLast());
        }
        operators.add(token);
      }
    }

    while (operators.isNotEmpty) {
      output.add(operators.removeLast());
    }

    return output;
  }

  // [MDIR:evaluateRPN] Evaluate expression in Reverse Polish Notation
  double evaluateRPN(List<String> rpn) {
    List<double> stack = [];

    for (String token in rpn) {
      if (isNumeric(token)) {
        stack.add(double.parse(token));
      } else {
        double b = stack.removeLast();
        double a = stack.removeLast();
        double res;

        switch (token) {
          case '+':
            res = a + b;
            break;
          case '-':
            res = a - b;
            break;
          case '*':
            res = a * b;
            break;
          case '/':
            res = a / b;
            break;
          default:
            throw Exception('Unknown operator: $token');
        }

        stack.add(res);
      }
    }

    return stack.last;
  }

  // [MDIR:isNumeric] Check if a string is numeric
  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }
}
