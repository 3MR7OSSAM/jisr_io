import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jisr/core/common/widgets/custom_button.dart';
import 'package:jisr/presentation/orders/widgets/order_summary.dart';

import '../../../core/common/widgets/app_title_widget.dart';
import '../../../core/common/widgets/search_and_status_bar.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/entities/order_model.dart';
import '../widgets/back_and_time_widget.dart';
import '../widgets/order_card.dart';
import '../widgets/order_details_item_widget.dart';
import '../widgets/order_details_widget.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h,),
            const SearchAndStatusWidget(),
            const Center(child: AppTitleWidget()),

            const BackAndTimeWidget(),
            const OrderDetailsWidget(),
            const Center(child: SizedBox(width: 300, child: Divider())),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Products:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary),
              ),
            ),
            SizedBox(
              height: 0.26.sh,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const ItemDetails(
                      itemName: 'Boost Energy Original',
                      total: '\$350',
                      imagePath: 'assets/images/place_holder.png',
                      itemCode: '1014093',
                      quantity: 3,
                      unitPrice: 7.5, // Replace with actual image path
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: OrderSummaryWidget(),
            ),
            const Row(
              children: [
                Expanded(
                  child: CustomButton(
                    bgColor: Colors.green,
                    child: Text(
                      'Accept',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    bgColor: AppColors.redColor,
                    child: Text(
                      'Reject',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




