import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<int> {
  AppCubit({required this.itemCount}) : super(1);

  final int itemCount;

  void changeIndex(int index) {
    if (index < 0 && index > itemCount) return;
    emit(index);
  }

  void goHome() {
    if (state != 0) {
      emit(0);
    }
  }
}
