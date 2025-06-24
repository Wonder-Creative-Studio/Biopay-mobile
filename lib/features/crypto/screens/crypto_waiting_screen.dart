import 'package:biopay_mobile/constants/assets.dart';
import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CryptoWaitingScreen extends StatefulWidget {
  const CryptoWaitingScreen({super.key});

  @override
  State<CryptoWaitingScreen> createState() => _CryptoWaitingScreenState();
}

class _CryptoWaitingScreenState extends State<CryptoWaitingScreen> {
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
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Waiting for Approval',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'A connection request was sent to MetaMask. Please approve it to continue.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Image.asset(
                Assets.cryptoLanding,
                height: 280,
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                'Not seeing anything? Ensure MetaMask is open\nand you are logged in.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white60, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child : SizedBox(
                width: double.infinity,
                child: CustomFilledButton(
                  onPressed: () {
                    context.push(Routes.cryptoSetUpiSrceen);
                  },
                  title: 'Continue',
                  width: SizeUtils.screenWidth,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
