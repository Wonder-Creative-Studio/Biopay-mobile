import 'dart:developer' as d;
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../constants/assets.dart';
import '../../../widgets/common_app_bar.dart';
import '../widgets/upi_card.dart';
import '../widgets/wallet_balance_card.dart';
import '../widgets/spending_chart_card.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  List<Point> _points = [];

  @override
  void initState() {
    super.initState();
    _generateRandomData();
  }

  void _generateRandomData() {
    final random = Random();
    final data = List<Point>.generate(12, (index) {
      return Point(index.toDouble(), 80000 + random.nextDouble() * 20000);
    });
    setState(() {
      _points = data;
    });
  }

  final List<Widget> cardItems = [
    UpiCard(
      backgroundAsset: Assets.upiCard,
      topRightAsset: 'UPI',
      topLeftWidget: Image.asset(Assets.upiLogo, height: 24),
      bottomCardNumber: 'UPI ID: Albert72@biopay',
      viewTransactionsText: 'View Transactions',
      viewTransactionsIcon: Icons.text_snippet,
      onViewTransactions: () {
        d.log("message");
      },
      checkBalanceText: 'Bank Balance',
      checkBalanceIcon: Icons.account_balance_wallet,
      onCheckBalance: () {
        d.log("message");
      },
      sendMoneyText: 'Send Money',
      sendMoneyIcon: Icons.arrow_upward,
      onSendMoney: () {
        d.log("message");
      },
    ),
    UpiCard(
      backgroundAsset: Assets.aadharLinkCard,
      topRightAsset: "AEPS",
      topLeftWidget: Image.asset(Assets.aepsLogo, height: 24),
      bottomCardNumber: 'Linked Aadhaar: XXXX-XXXX-1234',
      viewTransactionsText: 'View Transactions',
      viewTransactionsIcon: Icons.text_snippet,
      onViewTransactions: () {
        d.log("message");
      },
      checkBalanceText: 'Bank Balance',
      checkBalanceIcon: Icons.account_balance_wallet,
      onCheckBalance: () {
        d.log("message");
      },
      sendMoneyText: 'Cash Withdrawal',
      sendMoneyIcon: Icons.line_axis_outlined,
      onSendMoney: () {
        d.log("message");
      },
    ),
    UpiCard(
      backgroundAsset: Assets.bankCard,
      topRightAsset: "Cards",
      topLeftWidget: Icon(Icons.credit_card),
      bottomCardNumber: 'Linked Aadhaar: XXXX-XXXX-1234',
      viewTransactionsText: 'View Transactions',
      viewTransactionsIcon: Icons.text_snippet,
      onViewTransactions: () {
        d.log("message");
      },
      checkBalanceText: 'Card Details',
      checkBalanceIcon: Icons.account_balance_wallet,
      onCheckBalance: () {
        d.log("message");
      },
      sendMoneyText: 'Send Money',
      sendMoneyIcon: Icons.arrow_upward,
      onSendMoney: () {
        d.log("message");
      },
    ),
    UpiCard(
      backgroundAsset: Assets.cryptoCard,
      topRightAsset: "Crypto",
      topLeftWidget: Image.asset(Assets.bitcoin, height: 24),
      bottomCardNumber: 'Wallet Address: 0xAB...123F',
      viewTransactionsText: 'View Transactions',
      viewTransactionsIcon: Icons.text_snippet,
      onViewTransactions: () {
        d.log("message");
      },
      checkBalanceText: 'Crypto Balance',
      checkBalanceIcon: Icons.account_balance_wallet,
      onCheckBalance: () {
        d.log("message");
      },
      sendMoneyText: 'Send Crypto',
      sendMoneyIcon: Icons.arrow_upward,
      onSendMoney: () {
        d.log("message");
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        userName: 'Albert Flores',
        userAvatar: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            "https://cdn.noitatnemucod.net/thumbnail/300x400/100/9cbcf87f54194742e7686119089478f8.jpg",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Icon(Icons.qr_code_scanner, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CarouselSlider(
              items: cardItems,
              options: CarouselOptions(
                height: 320.0,
                enlargeCenterPage: false,
                viewportFraction: 0.9,
                enableInfiniteScroll: true,
                initialPage: 0,
              ),
            ),

            // Wallet Balance
            const WalletBalanceCard(
              balance: 12450.00,
              percentChange: 5.2,
              amountChange: 615,
            ),

            // Spending Chart
            SpendingChartCard(
              percentChange: 8.6,
              amountChange: 620,
              points: _points,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
