import 'package:biopay_mobile/constants/assets.dart';
import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransactionSuccessScreen extends StatefulWidget {
  const TransactionSuccessScreen({super.key});

  @override
  State<TransactionSuccessScreen> createState() => _TransactionSuccessScreenState();
}

class _TransactionSuccessScreenState extends State<TransactionSuccessScreen> {
  final String amount = "2,500";
  final String recipient = "Arya Sharma (arya@upi)";
  final String dateTime = "28 April 2025, 2:45 PM";
  final String referenceId = "TXN1234567890";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Transaction Successful!",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),

            // Illustration
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                height: 200,
                child: Image.asset(
                  Assets.rocketSuccess, // replace with your asset path
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Amount Sent
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Amount Sent",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "₹$amount",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  infoRow("To :", recipient),
                  const SizedBox(height: 12),
                  infoRow("Date & Time :", dateTime),
                  const SizedBox(height: 12),
                  infoRow("Reference ID :", referenceId),
                ],
              ),
            ),

            const Spacer(),

            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: CustomFilledButton(
                  onPressed: (){
                    context.push(Routes.linkYourUpiScreen);
                  },
                  title: 'Continue',
                  width: SizeUtils.screenWidth,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 15),
          ),
        ),
        Spacer(),
        Expanded(
          flex: 0,
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
