import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../constants/assets.dart';
import '../widgets/upi_card.dart';
import '../widgets/wallet_balance_card.dart';
import '../widgets/spending_chart_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            height: 350,
            child: PageView(
              children: [
                UpiCard(
                  backgroundAsset: Assets.upiCard,
                  topRightAsset: 'UPI',
                  topLeftWidget: Image.asset(Assets.upiLogo, height: 24),
                  bottomCardNumber: 'UPI ID: Albert72@biopay',
                  viewTransactionsText: 'View Transactions',
                  viewTransactionsIcon: Icons.text_snippet,
                  onViewTransactions: () {
                    log("message");
                  },
                  checkBalanceText: 'Bank Balance',
                  checkBalanceIcon: Icons.account_balance_wallet,
                  onCheckBalance: () {
                    log("message");
                  },
                  sendMoneyText: 'Send Money',
                  sendMoneyIcon: Icons.arrow_upward,
                  onSendMoney: () {
                    log("message");
                  },
                ),
                UpiCard(
                  backgroundAsset: Assets.aadharLinkCard,
                  topRightAsset: "AEPS",
                  topLeftWidget: Image.asset(Assets.aepsLogo, height: 24),
                  bottomCardNumber: 'UPI ID: Albert.business@biopay',
                  viewTransactionsText: 'View Transactions',
                  viewTransactionsIcon: Icons.text_snippet,
                  onViewTransactions: () {
                    log("message");
                  },
                  checkBalanceText: 'Bank Balance',
                  checkBalanceIcon: Icons.account_balance_wallet,
                  onCheckBalance: () {
                    log("message");
                  },
                  sendMoneyText: 'Send Money',
                  sendMoneyIcon: Icons.arrow_upward,
                  onSendMoney: () {
                    log("message");
                  },
                ),
              ],
            ),
          ),

          // Wallet Balance
          const WalletBalanceCard(
            balance: 12450.00,
            percentChange: 5.2,
            amountChange: 615,
          ),

          // Spending Chart
          const SpendingChartCard(percentChange: 8.6, amountChange: 620),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
