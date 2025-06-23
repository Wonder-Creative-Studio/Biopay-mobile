import 'package:biopay_mobile/constants/assets.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveMoneyScreen extends StatefulWidget {
  const ReceiveMoneyScreen({super.key});

  @override
  State<ReceiveMoneyScreen> createState() => _ReceiveMoneyScreenState();
}

class _ReceiveMoneyScreenState extends State<ReceiveMoneyScreen> {
  final String upiId = "AlbertFlores@biopay";
  final String phoneNumber = "+91 98765 43210";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          "Receive Money",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Your UPI ID",
                style: TextStyle(color: Colors.white70),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(
                    Assets.upiLogo,
                  ), // Replace with your local image
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        upiId,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        phoneNumber,
                        style: const TextStyle(color: Colors.white54),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.copy, color: Colors.white),
              ],
            ),
            const SizedBox(height: 40),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     const SizedBox(height: 40),
            //     QrImage(
            //       data: upiId,
            //       version: QrVersions.auto,
            //       size: 240,
            //       backgroundColor: Colors.white,
            //     ),
            //     const SizedBox(height: 20),
            //     ElevatedButton(
            //       onPressed: () {},
            //       child: const Text("Share QR code"),
            //     )
            //   ],
            // ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black,
              child: Image.asset(
                Assets.qrCode,
                width: 240,
                height: 240,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: CustomFilledButton(
                onPressed: (){
                },
                title: "Share QR code",
                width: SizeUtils.screenWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
