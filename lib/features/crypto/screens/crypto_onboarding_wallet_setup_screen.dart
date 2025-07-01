import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/assets.dart';
import '../../../router/routes.dart';
import '../../../widgets/basic_app_bar.dart';
import '../../../widgets/custom_filled_button.dart';

class CryptoOnboardingWalletSetupScreen extends StatelessWidget {
  const CryptoOnboardingWalletSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "Crypto Wallet Setup"),
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
            const SizedBox(height: 8),
            Text(
              "Connect your MetaMask wallet to manage, send, and receive crypto directly from Bio Pay.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 80),
            Center(child: Image.asset(Assets.metamask, height: 150)),
            const SizedBox(height: 80),
            Text(
              "What You Can Do:",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildFeatureItem(context, "View your crypto balances"),
            _buildFeatureItem(context, "Check transaction history"),
            _buildFeatureItem(context, "Send & receive tokens securely"),
            const SizedBox(height: 24),
            CustomFilledButton(
              onPressed: () {
                context.push(
                  Routes.cryptoOnboardingAuthorizationRequiredScreen,
                );
              },
              title: "Connect MetaMask Wallet",
            ),
            Spacer(),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text("Don’t have MetaMask? Get MetaMask"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check, size: 20),
          const SizedBox(width: 8),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
