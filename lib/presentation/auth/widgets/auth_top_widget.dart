import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/widgets/basic_eclipse.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/theme/app_colors.dart';

class AuthTopWidget extends StatelessWidget {
  const AuthTopWidget({
    super.key, required this.title, required this.subtitle, required this.buttonTitle, this.onTap,
  });
  final String title;
  final String subtitle;
  final String buttonTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      height: 0.35.sh,
      width: 1.sh,
      child: Stack(
        children: [
          const Positioned(
            top: 0,
            right: 0,
            child: EclipseContainer(opacity: 0.35,),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.appLogo,
                  width: 150.w,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      subtitle,
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.whiteColor),
                    ),
                    const SizedBox(width: 5,),
                    InkWell(
                      onTap: onTap,
                      child:  Text(
                        buttonTitle,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.primary,fontWeight: FontWeight.bold),
                      ),
                    ),

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
