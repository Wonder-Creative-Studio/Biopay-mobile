import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../authentication/models/otp_screen_arguments.dart';
import '../../../router/routes.dart';
import '../../../widgets/basic_app_bar.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_input_field.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({super.key});

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  final TextEditingController _debitCardController = TextEditingController();
  final TextEditingController _expiryMonthController = TextEditingController();
  final TextEditingController _expiryYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "Verify Your Account"),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "To verify your account, please enter your debit card details. This is required for secure and instant verification.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Text(
              "Last 6 digits of your debit card",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            CustomInputField(
              controller: _debitCardController,
              hintText: "654451",
              keyBoardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Text(
              "Expiry date (MM/YY)",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    controller: _expiryMonthController,
                    hintText: "MM",
                    keyBoardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomInputField(
                    controller: _expiryYearController,
                    hintText: "YY",
                    keyBoardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomFilledButton(
              onPressed: () {
                context.push(
                  Routes.otpScreen,
                  extra: OtpScreenArguments(
                    title: "Enter the OTP",
                    description:
                        "We have sent an OTP to your registered mobile number. Please enter it below.",
                    onVerify: () {
                      context.push(Routes.setUpiPinScreen);
                    },
                    onResend: () {},
                  ),
                );
              },
              title: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
