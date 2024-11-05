import 'package:flutter_bloc/flutter_bloc.dart';

class TabCubit extends Cubit<int> {
  TabCubit() : super(0); // Initial tab is 0

  void selectTab(int index) {
    emit(index);
  }
}
