import 'package:flutter/material.dart';
import '../../../constants/assets.dart';
import '../../../widgets/basic_app_bar.dart';
import '../../../widgets/custom_filled_button.dart';

class CryptoOnboardingAuthorizationRequiredScreen extends StatelessWidget {
  const CryptoOnboardingAuthorizationRequiredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "Crypto Wallet Setup"),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              "Authorization Required",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "MetaMask will ask for your permission to connect with Bio Pay",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 80),
            Center(child: Image.asset(Assets.metamask, height: 150)),
            const SizedBox(height: 80),
            CustomFilledButton(onPressed: () {}, title: "Proceed to Authorize"),
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
}
