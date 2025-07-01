import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String icon;
  final String name;
  final String time;
  final double amount;
  final bool isExpense;

  const TransactionItem({
    super.key,
    required this.icon,
    required this.name,
    required this.time,
    required this.amount,
    required this.isExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              icon,
              width: 42,
              height: 42,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image, size: 40, color: Colors.white);
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            isExpense
                ? Icons.arrow_drop_down_rounded
                : Icons.arrow_drop_up_rounded,
            color: isExpense ? Colors.red : Colors.green,
            size: 30,
          ),
          const SizedBox(width: 8),
          Text(
            '₹${amount.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
