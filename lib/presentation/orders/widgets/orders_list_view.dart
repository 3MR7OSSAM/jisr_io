import 'package:flutter/material.dart';
import 'package:jisr/domain/entities/order_model.dart';

import 'order_card.dart';

class OrdersListView extends StatelessWidget {
  final String status;

  const OrdersListView({required this.status, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 5, // For demonstration, replace with your order count
      itemBuilder: (context, index) {
        return OrderCard(
         order: OrderModel(orderId: '320965629',
           code: '9966',
           timeLeft: '1:10',
           deliveryService: 'JAHEZ',
           status: 'Paid',
           amount: 3.76, orderSource: 'Marsol', paymentStatus: 'Paid',), // Replace with actual image URLs
        );
      },
    );
  }


}
