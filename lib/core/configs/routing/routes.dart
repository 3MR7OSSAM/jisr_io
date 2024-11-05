import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jisr/core/configs/controller/pages_controller.dart';
import 'package:jisr/presentation/orders/pages/order_details.dart';

import '../../../presentation/auth/pages/login.dart';
import '../../../presentation/settings/pages/settings.dart';
import '../../../presentation/splash/pages/splash.dart';


class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/homeRoute";
  static const String loginRoute = "/loginRoute";
  static const String registerRoute = "/registerRoute";
  static const String settingsRoute = "/settingsRoute";
  static const String orderDetails = "/orderDetails";
  static const String pagesController = "/pagesController";

}

// Helper method for page transitions
CustomTransitionPage customPageTransition(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.splashRoute,
  routes: [
    GoRoute(
      path: Routes.splashRoute,
      name: 'splash',
      pageBuilder: (context, state) => customPageTransition(const SplashPage()),
    ),
    GoRoute(
      path: Routes.loginRoute,
      name: 'loginRoute',
      pageBuilder: (context, state) => customPageTransition(const LoginPage()),
    ),

    GoRoute(
      path: Routes.orderDetails,
      name: 'orderDetails',
      pageBuilder: (context, state) => customPageTransition(const OrderDetailsPage()),
    ),
    GoRoute(
      path: Routes.settingsRoute,
      name: 'settingsRoute',
      pageBuilder: (context, state) => customPageTransition(const SettingsPage()),
    ),
    GoRoute(
      path: Routes.pagesController,
      name: 'pagesController',
      pageBuilder: (context, state) => customPageTransition(PagesController()),
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: SafeArea(
      child: Center(
        child: Text(
          'No Route Found',
          style: TextStyle(fontSize: 35),
        ),
      ),
    ),
  ),
);