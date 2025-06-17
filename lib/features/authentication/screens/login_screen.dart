import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_input_field.dart';
import '../models/otp_screen_arguments.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController mobileController = TextEditingController();

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
            Text(
              "Welcome Back",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Please sign in to continue.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),
                    Text("Mobile Number", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    CustomInputField(
                      controller: mobileController,
                      hintText: "Enter Mobile Number",
                    ),
                    const SizedBox(height: 24),
                    CustomFilledButton(
                      onPressed: () {
                        context.push(
                          Routes.otpScreen,
                          extra: OtpScreenArguments(
                            title: "Enter the OTP",
                            description:
                                "We've sent a 6-digit code to +91 98765 43210",
                            onVerify: () {
                              log("[LoginScreen] Verify OTP]");
                              context.push(Routes.landingScreen);
                            },
                            onResend: () {
                              log("[LoginScreen] Resend OTP]");
                            },
                          ),
                        );
                      },
                      title: "Sign In Securely",
                      icon: Icon(Icons.arrow_forward_rounded),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () => context.push(Routes.signUpScreen),
                child: Text("Don’t have an account? Sign up"),
              ),
            ),
            const SizedBox(height: 24), // Add some space at the bottom
          ],
        ),
      ),
    );
  }
}
