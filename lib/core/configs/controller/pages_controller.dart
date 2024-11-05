import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jisr/core/configs/controller/ButtomNavBar.dart';
import 'package:jisr/core/configs/theme/app_colors.dart';
import '../../../presentation/history/pages/history.dart';
import '../../../presentation/orders/pages/orders.dart';
import '../../../presentation/settings/pages/settings.dart';

class PagesController extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0); // Set initialPage to 0

  PagesController({super.key});

  void _onItemTapped(BuildContext context, int index) {
    context.read<BottomNavCubit>().changePage(index);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<BottomNavCubit, int>(
          builder: (context, state) {
            return PageView(
              controller: _pageController,
              onPageChanged: (index) {
                context.read<BottomNavCubit>().changePage(index);
              },
              children: const [
                OrdersPage(),
                HistoryPage(),
                SettingsPage()
              ],
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.primary,

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: BottomNavigationBar(
                  currentIndex: state,
                  onTap: (index) => _onItemTapped(context, index),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedFontSize: 14,
                  unselectedFontSize: 14,
                  selectedItemColor: AppColors.orangeColor,
                  unselectedItemColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home, color: state == 0 ? AppColors.orangeColor : AppColors.whiteColor),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.history, color: state == 1 ? AppColors.orangeColor: AppColors.whiteColor),
                      label: 'History',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings, color: state == 2 ? AppColors.orangeColor: AppColors.whiteColor),
                      label: 'Settings',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.logout, color: state == 3 ?AppColors.orangeColor : AppColors.whiteColor),
                      label: 'Logout',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
