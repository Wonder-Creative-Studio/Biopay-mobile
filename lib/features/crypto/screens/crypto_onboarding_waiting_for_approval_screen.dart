import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/assets.dart';
import '../../../router/routes.dart';
import '../../../widgets/basic_app_bar.dart';
import '../../../widgets/custom_filled_button.dart';

class CryptoOnboardingWaitingForApprovalScreen extends StatelessWidget {
  const CryptoOnboardingWaitingForApprovalScreen({super.key});

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
              "Waiting for Approval",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "A connection request was sent to MetaMask. Please approve it to continue.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 40),
            Center(child: Image.asset(Assets.waitingForMetamask, height: 400)),
            const SizedBox(height: 24),
            Center(
              child: Text(
                "Not seeing anything? Ensure MetaMask is open and you are logged in.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Spacer(),
            CustomFilledButton(
              onPressed: () {
                context.push(Routes.cryptoOnboardingSetUpiPinScreen);
              },
              title: "Check Again",
            ),
          ],
        ),
      ),
    );
  }
}
