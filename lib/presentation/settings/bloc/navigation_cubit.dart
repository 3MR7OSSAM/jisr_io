
import 'package:flutter_bloc/flutter_bloc.dart';

enum SettingsView { main, profile, menu, workingTime }

class NavigationCubit extends Cubit<SettingsView> {
  NavigationCubit() : super(SettingsView.main);

  void showMain() => emit(SettingsView.main);
  void showProfile() => emit(SettingsView.profile);
  void showMenu() => emit(SettingsView.menu);
  void showWorkingTime() => emit(SettingsView.workingTime);
}
