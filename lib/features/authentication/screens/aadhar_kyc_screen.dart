import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_input_field.dart';
import '../models/otp_screen_arguments.dart';

class AadharKycScreen extends StatelessWidget {
  AadharKycScreen({super.key});
  final TextEditingController aadharNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Complete KYC with Aadhaar",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.push(Routes.linkBankAccountScreen);
                  },
                  child: Text("Skip", style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Enable AEPS transactions and higher limits",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    Text("Aadhaar Number", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    CustomInputField(
                      controller: aadharNumberController,
                      hintText: "Enter your 12-digit Aadhaar",
                    ),
                    const SizedBox(height: 24),
                    CustomFilledButton(
                      onPressed: () {
                        context.push(
                          Routes.otpScreen,
                          extra: OtpScreenArguments(
                            title: "Verify Aadhaar",
                            description:
                                "We’ve sent a 6-digit OTP to your Aadhaar-linked mobile.",
                            onVerify: () {
                              log("[AadharKycScreen] Verify OTP]");
                              context.push(Routes.linkBankAccountScreen);
                            },
                            onResend: () {
                              log("[AadharKycScreen] Resend OTP]");
                            },
                          ),
                        );
                      },
                      title: "Send OTP",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
