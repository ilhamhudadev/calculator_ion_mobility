import 'package:bloc/bloc.dart';

class StatusNetworkCubit extends Cubit<bool> {
  StatusNetworkCubit() : super(false);

  void updateStatus(bool status) => emit(status);
}
