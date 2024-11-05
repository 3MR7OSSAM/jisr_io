import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/configs/routing/routes.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/entities/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final bool isListView;

  const OrderCard({
    super.key,
    required this.order,
    this.isListView = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: (){
          GoRouter.of(context).push(Routes.orderDetails);
        },
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildTopRow(),
              const SizedBox(height: 10.0),
              _buildBottomRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.receipt, color: AppColors.primary, size: 18),
            const SizedBox(width: 4.0),
            Text(
              order.orderId,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: order.timeLeft == null ? _statusColor(order.status) : AppColors.orangeColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                order.timeLeft != null ?
                'Time Left: ${order.timeLeft}' : order.status,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Row(
              children: [
                const Icon(Icons.local_shipping, color: Colors.black54, size: 16),
                const SizedBox(width: 4.0),
                Text(
                  order.orderSource,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.key, size: 16, color: Colors.grey),
            const SizedBox(width: 4.0),
            Text(
              'Code: ${order.code}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              order.paymentStatus == 'Paid' ? Icons.check_circle : Icons.cancel,
              size: 16,
              color: order.paymentStatus == 'Paid' ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 4.0),
            Text(
              order.paymentStatus,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.monetization_on, size: 16, color: Colors.black87),
            const SizedBox(width: 4.0),
            Text(
              '${order.amount} SAR',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      case 'Pending':
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }
}
