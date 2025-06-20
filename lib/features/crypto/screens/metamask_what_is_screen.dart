import 'package:biopay_mobile/widgets/basic_app_bar.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';

class MetamaskWhatIsScreen extends StatelessWidget {
  const MetamaskWhatIsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'What is MetaMask?'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Start Your Crypto Journey",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "MetaMask is a secure digital wallet for storing, sending, and receiving cryptocurrencies. \nWith MetaMask, you can:",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            _buildFeatureRow(
              context,
              "Safely store your crypto coins and tokens",
            ),
            _buildFeatureRow(context, "Easily connect to apps like Bio Pay"),
            _buildFeatureRow(
              context,
              "Control your funds with your own private keys",
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/metamask.png', // Assuming MetaMask illustration is in assets
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 32),
            CustomFilledButton(
              onPressed: () {
                context.push(Routes.metamaskCreateAccountScreen);
              },
              title: "Learn How to Get MetaMask",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check, size: 20, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
