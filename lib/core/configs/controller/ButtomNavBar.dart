import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0); // Start with the "Orders" page as default.

  void changePage(int index) => emit(index);
}
