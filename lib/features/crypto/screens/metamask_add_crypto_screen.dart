import 'package:biopay_mobile/constants/colors.dart';
import 'package:biopay_mobile/widgets/basic_app_bar.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../router/routes.dart';

class MetamaskAddCryptoScreen extends StatelessWidget {
  const MetamaskAddCryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Add Crypto to MetaMask'),
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
            const SizedBox(height: 16),
            _buildStepText(context, "1. Open MetaMask and log in."),
            _buildStepText(
              context,
              "2. Tap “Receive” to see your wallet address (QR code or text).",
            ),
            _buildStepText(
              context,
              "3. Copy your wallet address or share the QR code.",
            ),
            _buildStepText(
              context,
              "4. Use this address to receive crypto from another wallet or exchange.",
            ),
            const Expanded(child: SizedBox()),
            CustomFilledButton(
              onPressed: () async {
                final Uri url = Uri.parse('https://metamask.io/');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              title: "Go to MetaMask Website",
            ),
            const SizedBox(height: 16),
            CustomFilledButton(
              backgroundColor: buttonBGGrey,
              onPressed: () {
                context.go(Routes.landingScreen, extra: 0);
              },
              title: "Back to Bio Pay Home",
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
