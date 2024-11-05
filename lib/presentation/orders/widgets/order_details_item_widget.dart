import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String itemName;
  final String itemCode;
  final int quantity;
  final double unitPrice;
  final String total;
  final String imagePath;

  const ItemDetails({
    super.key,
    required this.itemName,
    required this.itemCode,
    required this.quantity,
    required this.unitPrice,
    required this.total,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image on the left
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(width: 15),

          // Text details on the right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Item code : $itemCode',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                // const SizedBox(height: 4),
                Text(
                  'Quantity : $quantity',
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  'Unit price : ${unitPrice.toStringAsFixed(2)} SAR',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  'Total: $total SAR',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
