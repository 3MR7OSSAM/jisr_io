import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jisr/presentation/settings/pages/working_time_widget.dart';
import '../../../core/common/widgets/app_title_widget.dart';
import '../../../core/common/widgets/search_and_status_bar.dart';
import '../../history/pages/history.dart';
import '../bloc/navigation_cubit.dart';
import '../widgets/settings_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, SettingsView>(
        builder: (context, currentView) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchAndStatusWidget(),
                if (currentView == SettingsView.main) ...[
                  const Center(child: AppTitleWidget()),
                  SizedBox(
                    height: 0.3.sh,
                    child: ListView.separated(
                      itemCount: 4,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 1,
                          color: Colors.grey,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        switch (index) {
                          case 0:
                            return SettingsWidget(
                              title: 'My Profile',
                              icon: Icons.account_circle_outlined,
                              // onTap: () => context.read<NavigationCubit>().showProfile(),
                              onTap: () => print('Trigger Profile'),
                            );
                          case 1:
                            return SettingsWidget(
                              title: 'Menu',
                              icon: Icons.restaurant_menu,
                              onTap: () => print('Trigger Menu'),
                            );
                          case 2:
                            return SettingsWidget(
                              title: 'Working Time',
                              icon: Icons.access_time,
                              onTap: () => context
                                  .read<NavigationCubit>()
                                  .showWorkingTime(),
                            );
                          case 3:
                            return SettingsWidget(
                              title: 'Language',
                              icon: Icons.language,
                              trailingText: 'English',
                              // Replace with dynamic language if needed
                              onTap: () {
                                // Implement language selection functionality here
                              },
                            );
                          default:
                            return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: Text(
                        "Version 9.4.0 (206)",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ]
                // else if (currentView == SettingsView.profile)
                //   ProfilePage(onBack: () => context.read<NavigationCubit>().showMain())
                // else if (currentView == SettingsView.menu)
                //     MenuPage(onBack: () => context.read<NavigationCubit>().showMain())
                else if (currentView == SettingsView.workingTime)
                  WorkingTimeWidget(
                      onBack: () => context.read<NavigationCubit>().showMain()),
              ],
            ),
          );
        },
      ),
    );
  }
}
