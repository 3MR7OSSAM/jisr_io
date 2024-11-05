import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';


class RememberMe extends StatelessWidget {
  const RememberMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (bool? value) {},
              activeColor: AppColors.primary,
            ),
            const Text('Remember me',),
          ],
        ),
        GestureDetector(
          onTap: () {
            // Handle forgot password logic
          },
          child: const Text(
            'Forgot Password?',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
