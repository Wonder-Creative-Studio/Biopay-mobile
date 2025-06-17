import 'package:flutter/material.dart';

class SpendingChartCard extends StatelessWidget {
  final double percentChange;
  final double amountChange;
  final String selectedPeriod;
  final VoidCallback? onPeriodChange;

  const SpendingChartCard({
    super.key,
    required this.percentChange,
    required this.amountChange,
    this.selectedPeriod = 'This Month',
    this.onPeriodChange,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = percentChange >= 0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Spending',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              OutlinedButton(
                onPressed: onPeriodChange,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey[700]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      selectedPeriod,
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.grey[300]),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 150,
            alignment: Alignment.center,
            child: const Text(
              'Chart will be implemented here',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '${isPositive ? '+' : ''}${percentChange.toStringAsFixed(1)}% ',
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.red,
                  fontSize: 14,
                ),
              ),
              Text(
                '(${isPositive ? '+' : ''}₹${amountChange.toStringAsFixed(0)}) more than last month',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
