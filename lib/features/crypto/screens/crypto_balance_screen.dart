import 'package:biopay_mobile/constants/colors.dart';
import 'package:biopay_mobile/widgets/basic_app_bar.dart';
import 'package:flutter/material.dart';

class CryptoBalanceScreen extends StatelessWidget {
  const CryptoBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Crypto Balances'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Wallet Info Section (similar to CryptoScreen)
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: buttonBGGrey,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MetaMask Connected',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Wallet',
                    style: TextStyle(fontSize: 14, color: Colors.white54),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'OxAB...123F', // Placeholder address
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.refresh,
                        size: 18,
                        color: Colors.white54,
                      ),
                      const SizedBox(width: 4),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Refresh Wallet',
                          style: TextStyle(fontSize: 14, color: Colors.white54),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Your Tokens',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Tokens List/Table
            Expanded(
              child: ListView(
                children: const [
                  // Header Row
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Token',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Balance',
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
                  Divider(color: Colors.white12),
                  // Token Rows (Placeholder Data)
                  _TokenRow(
                    tokenIcon: Icons.currency_bitcoin,
                    tokenName: 'ETH',
                    balance: '0.543',
                    inrValue: '₹1,45,200',
                  ),
                  Divider(color: Colors.white12),
                  _TokenRow(
                    tokenIcon: Icons.currency_bitcoin,
                    tokenName: 'USDT',
                    balance: '100.00',
                    inrValue: '₹8,300',
                  ),
                  Divider(color: Colors.white12),
                  _TokenRow(
                    tokenIcon: Icons.currency_bitcoin,
                    tokenName: 'BTC',
                    balance: '0.005',
                    inrValue: '₹15,000',
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
}

class _TokenRow extends StatelessWidget {
  final IconData tokenIcon;
  final String tokenName;
  final String balance;
  final String inrValue;

  const _TokenRow({
    required this.tokenIcon,
    required this.tokenName,
    required this.balance,
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
            flex: 2,
            child: Row(
              children: [
                Icon(tokenIcon, size: 20, color: Colors.white),
                const SizedBox(width: 8),
                Text(tokenName, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              balance,
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
