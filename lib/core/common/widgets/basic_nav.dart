// import 'package:circle_nav_bar/circle_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:test_mate/core/utils/color_manger/color_manger.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../utils/route_manger/route_manger.dart';
//
// class BasicNavBar extends StatefulWidget {
//   const BasicNavBar({super.key});
//
//   @override
//   _BasicNavBarState createState() => _BasicNavBarState();
// }
//
// class _BasicNavBarState extends State<BasicNavBar> {
//   int _currentIndex = 1; // Initially, home is selected (index 1)
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//
//     // Implement navigation based on index
//     switch (index) {
//       case 0:
//         GoRouter.of(context).push(Routes.appDetails);
//
//         break;
//       case 1:
//         _currentIndex != 1 ? GoRouter.of(context).push(Routes.homePage) : null;
//
//         Navigator.pushNamed(context, '/home');
//         break;
//       case 2:
//         GoRouter.of(context).push(Routes.appDetails);
//
//         break;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CircleNavBar(
//       activeIcons: const [
//         Icon(Icons.add, color: ColorManger.darkGrey),
//         Icon(Icons.home, color: ColorManger.darkGrey),
//         Icon(FontAwesomeIcons.user, color: ColorManger.darkGrey, size: 20),
//       ],
//       inactiveIcons: const [
//         Text("Add New"),
//         Text("Home"),
//         Text("Profile"),
//       ],
//       color: Colors.white,
//       circleColor: Colors.white,
//       height: 60,
//       circleWidth: 60,
//       activeIndex: _currentIndex, // Set active index
//       onTap: _onItemTapped, // Handle navigation on tap
//       padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
//       cornerRadius: const BorderRadius.only(
//         topLeft: Radius.circular(8),
//         topRight: Radius.circular(8),
//         bottomRight: Radius.circular(24),
//         bottomLeft: Radius.circular(24),
//       ),
//       shadowColor: ColorManger.whiteColor.withOpacity(0.3),
//       circleShadowColor: ColorManger.primary,
//       elevation: 6,
//     );
//   }
// }
