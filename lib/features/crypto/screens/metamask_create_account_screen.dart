import 'package:biopay_mobile/widgets/basic_app_bar.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';

class MetamaskCreateAccountScreen extends StatelessWidget {
  const MetamaskCreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Create a MetaMask Account'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "How to Create a MetaMask Account",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "MetaMask is a secure digital wallet for storing, sending, and receiving cryptocurrencies. With MetaMask, you can:",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            _buildStepText(
              context,
              "1. Download the MetaMask app from the [App Store] or [Google Play].",
            ),
            _buildStepText(context, "2. Open the app and tap “Get Started."),
            _buildStepText(context, "3. Create a strong password."),
            _buildStepText(
              context,
              "4. Write down your Secret Recovery Phrase and keep it safe.",
            ),
            _buildStepText(context, "5. Confirm your Secret Recovery Phrase."),
            const Expanded(child: SizedBox()),
            CustomFilledButton(
              onPressed: () {
                context.push(Routes.metamaskAddCryptoScreen);
              },
              title: "Learn How to Add Crypto to MetaMask",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
