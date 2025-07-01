import 'package:biopay_mobile/constants/assets.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/basic_app_bar.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';

class SendCryptoSuccessScreen extends StatelessWidget {
  const SendCryptoSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Transaction Successful!'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Center(
                child: Image.asset(
                  Assets.onboardingSuccess,
                  height: SizeUtils.screenWidth * 0.6,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Amount Sent',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '₹8,000', // Placeholder amount
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              _buildDetailRow('Transaction Type', 'Send'),
              _buildDetailRow('Date & Time', '28 April 2025, 2:45 PM'),
              _buildDetailRow('Reference ID', 'TXN1234567890'),
              _buildDetailRow('Token', 'ETH'),
              _buildDetailRow('Receiver Wallet', 'OxF9...B21'),
              _buildDetailRow('Status', 'Success'),
              const SizedBox(height: 40),
              CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  context.go(Routes.landingScreen, extra: 3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label :',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
