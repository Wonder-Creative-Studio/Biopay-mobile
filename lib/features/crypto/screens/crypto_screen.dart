import 'package:biopay_mobile/constants/colors.dart';
import 'package:biopay_mobile/widgets/basic_app_bar.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';

class CryptoScreen extends StatelessWidget {
  const CryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: 'Crypto Wallet',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    context,
                    Icons.arrow_upward,
                    "Send Crypto",
                    () {
                      context.push(Routes.sendCryptoFormScreen);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildActionButton(
                    context,
                    Icons.arrow_downward,
                    "Receive Crypto",
                    () {
                      context.push(Routes.receiveCryptoScreen);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    context,
                    Icons.account_balance_wallet_outlined,
                    "View Balances",
                    () {
                      context.push(Routes.cryptoBalanceScreen);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildActionButton(
                    context,
                    Icons.list_alt,
                    "Transaction History",
                    () {
                      context.push(Routes.cryptoTransactionHistoryScreen);
                    },
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomFilledButton(
              title: 'Disconnect Wallet',
              onPressed: () {
                context.push(Routes.cryptoOnboardingGettingStartedScreen);
              },
              backgroundColor: buttonBGGrey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String text,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: buttonBGGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30.0),
            const SizedBox(height: 8.0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
