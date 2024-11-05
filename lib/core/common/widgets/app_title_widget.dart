import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configs/theme/app_colors.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
      child: const Text(
        "Innova Pharmacy | HHP15",
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
