import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/routes.dart';
import '../../../widgets/basic_app_bar.dart';
import '../../../widgets/custom_filled_button.dart';

class CryptoOnboardingGettingStartedScreen extends StatelessWidget {
  const CryptoOnboardingGettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "Getting started with Crypto"),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "How to Add Crypto to Your MetaMask Wallet",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Watch this short video to learn how crypto payments work in our app.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Center(
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.play_circle_fill,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ), // Spacer to push button to bottom
            CustomFilledButton(
              onPressed: () {
                context.push(Routes.cryptoOnboardingWalletSetupScreen);
              },
              title: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
