import 'package:biopay_mobile/constants/colors.dart';
import 'package:biopay_mobile/widgets/basic_app_bar.dart';
import 'package:flutter/material.dart';

class CryptoTransactionHistoryScreen extends StatefulWidget {
  const CryptoTransactionHistoryScreen({super.key});

  @override
  State<CryptoTransactionHistoryScreen> createState() =>
      _CryptoTransactionHistoryScreenState();
}

class _CryptoTransactionHistoryScreenState
    extends State<CryptoTransactionHistoryScreen> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Transaction History'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Filter Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _buildFilterButton('All', selectedFilter == 'All'),
                      _buildFilterButton('Send', selectedFilter == 'Send'),
                      _buildFilterButton(
                        'Received',
                        selectedFilter == 'Received',
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Transaction List Header
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Token',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Date & Time',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Amount',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'In ₹',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white12),
            // Transaction List (Placeholder Data)
            Expanded(
              child: ListView(
                children: const [
                  _TransactionRow(
                    tokenIcon: Icons.currency_bitcoin,
                    tokenName: 'ETH',
                    date: 'Apr 25, 11:30',
                    amount: '0.543',
                    inrValue: '₹1,45,200',
                  ),
                  Divider(color: Colors.white12),
                  _TransactionRow(
                    tokenIcon: Icons.currency_bitcoin,
                    tokenName: 'ETH',
                    date: 'Apr 24, 09:15',
                    amount: '100.00',
                    inrValue: '₹8,300',
                  ),
                  Divider(color: Colors.white12),
                  _TransactionRow(
                    tokenIcon: Icons.currency_bitcoin,
                    tokenName: 'USDT',
                    date: 'Apr 25, 11:30',
                    amount: '0.543',
                    inrValue: '₹1,45,200',
                  ),
                  Divider(color: Colors.white12),
                  _TransactionRow(
                    tokenIcon: Icons.currency_bitcoin,
                    tokenName: 'USDT',
                    date: 'Apr 24, 09:15',
                    amount: '100.00',
                    inrValue: '₹8,300',
                  ),
                  Divider(color: Colors.white12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text, bool isSelected) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              selectedFilter = text;
            });
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: isSelected ? buttonBGGrey : Colors.transparent,
            side: BorderSide(color: isSelected ? buttonBGGrey : Colors.white54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

class _TransactionRow extends StatelessWidget {
  final IconData tokenIcon;
  final String tokenName;
  final String date;
  final String amount;
  final String inrValue;

  const _TransactionRow({
    required this.tokenIcon,
    required this.tokenName,
    required this.date,
    required this.amount,
    required this.inrValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Icon(tokenIcon, size: 20, color: Colors.white),
                const SizedBox(width: 8),
                Text(tokenName, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(date, style: const TextStyle(fontSize: 16)),
          ),
          Expanded(
            flex: 1,
            child: Text(
              amount,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              inrValue,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
