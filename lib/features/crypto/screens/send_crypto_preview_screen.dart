import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/basic_app_bar.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';

class SendCryptoPreviewScreen extends StatelessWidget {
  const SendCryptoPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Send Crypto'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDetailRow('Token', 'ETH', icon: Icons.currency_bitcoin),
            _buildDetailRow('To', 'OxF9...B21'),
            _buildDetailRow('Amount', '0.01'),
            _buildDetailRow('Gas Fee', '₹35'),
            _buildDetailRow('Total', '₹8,000'),
            SizedBox(height: 40),
            CustomFilledButton(
              title: 'Confirm and Send',
              onPressed: () {
                context.push(Routes.sendCryptoPinScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          SizedBox(
            width: SizeUtils.screenWidth * 0.25,
            child: Text(
              '$label :',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20, color: Colors.white),
                const SizedBox(width: 8),
              ],
              Text(
                value,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
