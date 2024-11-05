import 'package:flutter/material.dart';
import 'package:jisr/core/common/helper/is_dark_mode.dart';

import '../../../core/configs/theme/app_colors.dart';

class TermsWidgets extends StatelessWidget {
  const TermsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: RichText(
        textAlign: TextAlign.center,
        text:  TextSpan(
          text: 'By signing up, you agree to the ',
          style: TextStyle(fontSize: 15,color: context.isDarkMode ? AppColors.whiteColor : AppColors.blackColor,),
          children: const [
            TextSpan(
              text: 'Terms of Service',
              style: TextStyle(color: AppColors.secondary), // Light blue-green color
              // You can also add an onTap function to handle link behavior if needed.
            ),
            TextSpan(
              text: ' and ',

            ),
            TextSpan(
              text: 'Data Processing Agreement',
              style: TextStyle(color: AppColors.secondary), // Light blue-green color
            ),
          ],
        ),
      ),
    );
  }
}
