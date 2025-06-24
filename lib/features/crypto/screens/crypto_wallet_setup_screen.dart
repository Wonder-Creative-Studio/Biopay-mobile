import 'package:biopay_mobile/constants/assets.dart';
import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CryptoWalletSetupScreen extends StatefulWidget {
  const CryptoWalletSetupScreen({super.key});

  @override
  State<CryptoWalletSetupScreen> createState() =>
      _CryptoWalletSetupScreenState();
}

class _CryptoWalletSetupScreenState extends State<CryptoWalletSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: Text(
          'Crypto Wallet Setup',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Text(
              'Start Your Crypto Journey',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Connect your MetaMask wallet to manage, send, and receive crypto directly from Bio Pay.',
              style: TextStyle(fontSize: 14, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Image.asset(
              Assets.metamask, // Replace with your image path
              height: 150,
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What You Can Do:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildFeatureRow('View your crypto balances'),
            _buildFeatureRow('Check transaction history'),
            _buildFeatureRow('Send & receive tokens securely'),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child : SizedBox(
                width: double.infinity,
                child: CustomFilledButton(
                  onPressed: () {
                    context.push(Routes.cryptoSignInScreen);
                  },
                  title: 'Connect MetaMask Wallet',
                  width: SizeUtils.screenWidth,
                ),
              ),
            ),

            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                // Handle MetaMask download action
              },
              child: Text.rich(
                TextSpan(
                  text: 'Don’t have MetaMask? ',
                  style: TextStyle(color: Colors.white70),
                  children: [
                    TextSpan(
                      text: 'Get MetaMask',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(Icons.check, color: Colors.white, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
