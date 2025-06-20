import 'package:biopay_mobile/constants/colors.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/routes.dart';
import '../../../widgets/transaction_item.dart';
import '../widgets/card_item_widget.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Card Details',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardItemWidget(
                balance: '\$5,750,20',
                cardNumber: '5282 3456 7890 1289',
                expiryDate: '09/25',
                cardColor: Colors.deepPurple,
                navigateOnTap: false,
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: CustomFilledButton(
                      onPressed: () {},
                      title: "Set as Primary",
                      icon: Icon(Icons.star_border),
                      isPrefixIcon: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomFilledButton(
                      onPressed: () {},
                      title: "Remove",
                      icon: Icon(Icons.delete_outline),
                      isPrefixIcon: true,
                      backgroundColor: buttonBGGrey2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildRecentTransactions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentTransactions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Card Transactions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                context.push(Routes.cardTransactionsHistoryScreen);
              },
              child: const Text(
                'View All',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  TransactionItem(
                    icon: 'assets/images/dribbble_logo.png',
                    name: 'Dribbble',
                    time: '2 days ago',
                    amount: 96.00,
                    isExpense: true,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
