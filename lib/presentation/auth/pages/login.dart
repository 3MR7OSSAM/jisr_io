import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jisr/core/common/widgets/basic_eclipse.dart';
import 'package:jisr/core/configs/assets/app_images.dart';
import 'package:jisr/core/configs/routing/routes.dart';
import 'package:jisr/core/configs/theme/app_colors.dart';
import 'package:jisr/presentation/auth/widgets/auth_top_widget.dart';
import 'package:jisr/presentation/auth/widgets/remember_me.dart';
import 'package:jisr/presentation/auth/widgets/terms_widgets.dart';

import '../../../core/common/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _storeCode = TextEditingController();

  final TextEditingController _password = TextEditingController();
  @override
  void dispose() {
    _storeCode.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset(AppImages.appLogo,width: 0.25.sh,),
          const SizedBox(height: 20),

          const Text('Welcome! Enter your store code to continue.',style: TextStyle(fontSize: 14,color: Colors.grey),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                _storeCodeField(context),
                const SizedBox(height: 20),
                _passwordField(context),
              
                const SizedBox(height: 20),
                Center(
                  child: CustomButton(
                    onTap: () {
                      GoRouter.of(context).go(Routes.pagesController);
                    },
                    bgColor: AppColors.primary,
                    child: const Text('Login',
                        style: TextStyle(color: Colors.white,fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: CustomButton(
                    onTap: () {
                      GoRouter.of(context).go(Routes.pagesController);
                    },
                    bgColor: const Color(0xffFFC403),
                    child: const Text('Enable All Notification',
                        style: TextStyle(color: Colors.white,fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _storeCodeField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: _storeCode,
        decoration: const InputDecoration(
          hintText: 'Store Code',
          hintStyle:TextStyle(fontWeight: FontWeight.w400),

        ).applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: _password,
        decoration: const InputDecoration(
          hintText: 'Password',
            hintStyle:TextStyle(fontWeight: FontWeight.w400),
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }
}

