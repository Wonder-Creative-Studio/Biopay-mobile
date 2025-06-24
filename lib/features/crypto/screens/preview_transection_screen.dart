import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PreviewTransectionScreen extends StatefulWidget {
  const PreviewTransectionScreen({super.key});

  @override
  State<PreviewTransectionScreen> createState() => _PreviewTransectionScreenState();
}

class _PreviewTransectionScreenState extends State<PreviewTransectionScreen> {
  final String token = "ETH";
  final String recipient = "0xF9...B21";
  final String amount = "0.01";
  final String gasFee = "₹35";
  final String total = "₹8,000";

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(width: 100, child: Text("$label :", style: const TextStyle(color: Colors.white))),
          Spacer(),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Send Crypto", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow("Token", "🪙 $token"),
            _buildRow("To", recipient),
            _buildRow("Amount", amount),
            _buildRow("Gas Fee", gasFee),
            _buildRow("Total", total),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child : SizedBox(
                width: double.infinity,
                child: CustomFilledButton(
                  onPressed: () {
                    context.push(Routes.previewTransectionScreen);
                  },
                  title: "Confirm and Send",
                  width: SizeUtils.screenWidth,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
