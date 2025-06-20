import 'package:flutter/material.dart';
import '../../../widgets/basic_app_bar.dart';
import '../../../widgets/transaction_item.dart';

class CardTransactionsHistoryScreen extends StatelessWidget {
  const CardTransactionsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "Transactions History"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              final isExpense = index % 2 == 0;
              final amount = isExpense ? 96.00 : 124.00;
              final name = isExpense ? 'Dribbble' : 'Spotify';
              final icon =
                  isExpense
                      ? 'assets/images/dribbble_logo.png'
                      : 'assets/images/spotify_logo.png';

              return Column(
                children: [
                  TransactionItem(
                    icon: icon,
                    name: name,
                    time: '${index + 1} days ago',
                    amount: amount,
                    isExpense: isExpense,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
