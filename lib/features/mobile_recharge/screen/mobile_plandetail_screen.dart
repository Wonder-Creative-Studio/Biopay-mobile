import 'package:biopay_mobile/features/upi/model/payment_argument.dart';
import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobilePlandetailScreen extends StatefulWidget {
  const MobilePlandetailScreen({super.key});

  @override
  State<MobilePlandetailScreen> createState() => _MobilePlandetailScreenState();
}

class _MobilePlandetailScreenState extends State<MobilePlandetailScreen> {
  final String category = 'Popular';
  final String price = '299';
  final String data = 'Unlimited 5G + 2GB Daily';
  final String calls = 'Unlimited Calls';
  final String details =
      'Unlimited 5G data, unlimited voice calling, 2GB high-speed data, 29 days validity, unlimited data at reduced speeds after quota';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Plan Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(category, style: const TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 24),
            const Text('Price', style: TextStyle(color: Colors.white54)),
            Text(price, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            const Text('Data', style: TextStyle(color: Colors.white54)),
            Text(data, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 24),
            const Text('Calls', style: TextStyle(color: Colors.white54)),
            Text(calls, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 24),
            const Text('Details', style: TextStyle(color: Colors.white54)),
            Text(
              details,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child : SizedBox(
                width: double.infinity,
                child: CustomFilledButton(
                  onPressed: () {
                    context.push(Routes.paymentScreen,extra: PaymentArguments(amt: price, showCardSelectionValue: true));
                  },
                  title: "Continue",
                  width: SizeUtils.screenWidth,
                ),
              ),
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // continue to next screen
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.blue,
            //       padding: const EdgeInsets.symmetric(vertical: 16),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //     ),
            //     child: const Text('Continue', style: TextStyle(fontSize: 16)),
            //   ),
            // ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
