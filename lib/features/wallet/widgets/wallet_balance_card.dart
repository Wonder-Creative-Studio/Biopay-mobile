import 'package:flutter/material.dart';

class WalletBalanceCard extends StatelessWidget {
  final double balance;
  final double percentChange;
  final double amountChange;

  const WalletBalanceCard({
    super.key,
    required this.balance,
    required this.percentChange,
    required this.amountChange,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = percentChange >= 0;

    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Wallet Balance',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            '₹${balance.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '${isPositive ? '+' : ''}${percentChange.toStringAsFixed(1)}% (${isPositive ? '+' : ''}₹${amountChange.toStringAsFixed(0)}) ',
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.red,
                  fontSize: 14,
                ),
              ),
              Text(
                'last month',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
