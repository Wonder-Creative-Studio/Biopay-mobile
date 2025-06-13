import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/size_utils.dart';
import '../../../widgets/custom_filled_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  int secondsRemaining = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40), // Add some space at the top
            Text(
              "Enter the OTP",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "We've sent a 6-digit code to +91 XXXXX 99999",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.white70),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),
                    Center(
                      child: Pinput(
                        controller: otpController,
                        length: 6,
                        defaultPinTheme: PinTheme(
                          width: SizeUtils.screenWidth * 0.12,
                          height: SizeUtils.screenWidth * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          // pinContentAlignment: MainAxisAlignment.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomFilledButton(
                      onPressed: () {},
                      title: "Verify & Continue",
                    ),
                  ],
                ),
              ),
            ),
            if (secondsRemaining == 0)
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      secondsRemaining = 30;
                    });
                  },
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            if (secondsRemaining > 0)
              Center(
                child: Text(
                  "Resend OTP in $secondsRemaining seconds",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            const SizedBox(height: 24), // Add some space at the bottom
          ],
        ),
      ),
    );
  }
}
