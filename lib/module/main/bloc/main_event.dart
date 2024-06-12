part of 'main_bloc.dart';

// class GetGreetings extends MainEvent {}

abstract class MainEvent {
  const MainEvent();

  List<Object> get props => [];
}

class MainButtonPressed extends MainEvent {
  final String buttonText;

  const MainButtonPressed(this.buttonText);

  @override
  List<Object> get props => [buttonText];
}
