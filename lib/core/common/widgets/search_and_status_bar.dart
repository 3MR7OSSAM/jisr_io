import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jisr/core/configs/theme/app_colors.dart';
import 'package:jisr/main.dart';

class SearchAndStatusWidget extends StatelessWidget {
  const SearchAndStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: SizedBox(
        height: 60.h,
        child: Row(
          children: [
            // Search Bar
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8.0),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            // Online Toggle
            Row(
              children: [
                Transform.scale(
                  scale: 0.8, // Adjust this value to change the switch size
                  child: Switch(
                    value: true,
                    onChanged: (bool value) {},
                    activeTrackColor: AppColors.secondary,
                    activeColor: AppColors.whiteColor,
                  ),
                ),
                const Text(
                  'Online',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
