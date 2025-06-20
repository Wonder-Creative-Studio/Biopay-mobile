import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/assets.dart';
import '../../../router/routes.dart';
import '../../../widgets/basic_app_bar.dart';
import '../../../widgets/custom_filled_button.dart';

class CryptoOnboardingWalletConnectedScreen extends StatelessWidget {
  const CryptoOnboardingWalletConnectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: ""),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Wallet Connected!",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Your wallet has been successfully connected to Bio Pay.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 40),
            Center(child: Image.asset(Assets.onboardingSuccess, height: 500)),
            const Expanded(child: SizedBox()),
            CustomFilledButton(
              onPressed: () {
                context.go(Routes.cryptoScreen);
              },
              title: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
