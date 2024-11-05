import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetailRow(Icons.receipt_long, "Order ID", "364165539"),
          const SizedBox(height: 3.0),
          buildDetailRow(Icons.calendar_today, "Date", "03 - 11 - 2024"),
          const SizedBox(height: 3.0),
          buildDetailRow(Icons.access_time, "Time", "11 : 57 : 33"),
          const SizedBox(height: 3.0),
          buildDetailRow(Icons.vpn_key, "Code", "9966"),
          const SizedBox(height: 3.0),
          buildDetailRow(Icons.credit_card, "Payment Method", "Card"),
          const SizedBox(height: 3.0),
          buildDetailRow(Icons.local_shipping, "Source", "JAHEZ"),
        ],
      ),
    );
  }

  Widget buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20.0, color: Colors.black54),
        const SizedBox(width: 8.0),
        Text(
          "$label : ",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}
