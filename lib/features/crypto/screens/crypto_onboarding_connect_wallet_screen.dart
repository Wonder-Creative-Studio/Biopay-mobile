import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/routes.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_input_field.dart';
import '../../authentication/models/otp_screen_arguments.dart';

class CryptoOnboardingConnectWalletScreen extends StatelessWidget {
  CryptoOnboardingConnectWalletScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Connect Your Wallet",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "To enhance security, please enter your email address. We'll send a One-Time Password (OTP) to verify your identity before connecting your MetaMask wallet.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Text(
              "Email Address",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            CustomInputField(
              controller: emailController,
              hintText: "Enter Email Connected to your Wallet",
              keyBoardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            CustomFilledButton(
              onPressed: () {
                context.push(
                  Routes.otpScreen,
                  extra: OtpScreenArguments(
                    title: "Enter the OTP",
                    description:
                        "We've sent a 6-digit OTP to your email address ${emailController.text}. Please enter it below to proceed.",
                    onVerify: () {
                      context.push(
                        Routes.cryptoOnboardingWaitingForApprovalScreen,
                      );
                    },
                    onResend: () {},
                  ),
                );
              },
              title: "Send OTP",
            ),
            Spacer(),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text("Don’t have MetaMask? Get MetaMask"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
