import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jisr/core/configs/routing/routes.dart';
import 'package:jisr/core/configs/theme/app_colors.dart';
import '../../../core/configs/assets/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.appLogo,width: 200.w,),
            const SizedBox(height: 15),

            const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: AppColors.primary,))
          ],
        ),
      ),
    );
  }

  void navigateToNext() {
    Future.delayed(const Duration(seconds: 3), () async {
      mounted?
      GoRouter.of(context).go(Routes.loginRoute):null;
    });
  }
}
