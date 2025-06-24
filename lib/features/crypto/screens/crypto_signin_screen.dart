import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:biopay_mobile/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CryptoSigninScreen extends StatefulWidget {
  const CryptoSigninScreen({super.key});

  @override
  State<CryptoSigninScreen> createState() => _CryptoSigninScreenState();
}

class _CryptoSigninScreenState extends State<CryptoSigninScreen> {
  final TextEditingController _emailController = TextEditingController();

  void _sendOtp() {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your email")),
      );
      return;
    }
    // Send OTP logic here
    print("Sending OTP to: $email");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              'Connect Your Wallet',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "To enhance security, please enter your email address. We'll send a One-Time Password (OTP) to verify your identity before connecting your MetaMask wallet.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              "Email Address",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            CustomInputField(
              controller: _emailController,
              hintText: "Enter Email Connected to your Wallet",
            ),

            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.black,
            //     border: Border.all(color: Colors.white24),
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            //   child: TextField(
            //     controller: _emailController,
            //     style: TextStyle(color: Colors.white),
            //     decoration: InputDecoration(
            //       hintText: "Enter Email Connected to your Wallet",
            //       hintStyle: TextStyle(color: Colors.white38),
            //       contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            //       border: InputBorder.none,
            //     ),
            //     keyboardType: TextInputType.emailAddress,
            //   ),
            // ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child : SizedBox(
                width: double.infinity,
                child: CustomFilledButton(
                  onPressed: () {
                    context.push(Routes.cryptoOtpScreen);
                  },
                  title: 'Send OTP',
                  width: SizeUtils.screenWidth,
                ),
              ),
            ),

            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: _sendOtp,
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.blue.shade700,
            //       padding: EdgeInsets.symmetric(vertical: 16),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(16),
            //       ),
            //     ),
            //     child: Text(
            //       'Send OTP',
            //       style: TextStyle(fontSize: 16),
            //     ),
            //   ),
            // ),
            Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigate to MetaMask download/help
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Don’t have MetaMask? ',
                    style: TextStyle(color: Colors.white70),
                    children: [
                      TextSpan(
                        text: 'Get MetaMask',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
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
