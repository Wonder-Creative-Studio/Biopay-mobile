import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController mobileController = TextEditingController();

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  bool isAgreed = false;

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
              "Create Your\nBioPay Account",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Secure and fast setup.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Text("Mobile Number", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    CustomInputField(
                      controller: mobileController,
                      hintText: "Enter mobile number",
                    ),
                    const SizedBox(height: 16),
                    Text("Full Name", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    CustomInputField(
                      controller: fullNameController,
                      hintText: "Enter your full name",
                    ),
                    const SizedBox(height: 16),
                    Text("Email (Optional)", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    CustomInputField(
                      controller: emailController,
                      hintText: "Enter your email",
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          value: isAgreed,
                          activeColor: Colors.transparent,
                          onChanged: (value) {
                            setState(() {
                              isAgreed = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            "I agree to the Terms & Conditions and Privacy Policy",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    CustomFilledButton(
                      onPressed: () {
                        context.push(Routes.aadharKycScreen);
                      },
                      title: "Create Account",
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        "or",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed:
                            () => context.push(Routes.merchantSignupScreen),
                        child: Text(
                          "Got a business? Join as a Merchant",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () => context.push(Routes.loginScreen),
                child: Text("Already have an account? Sign in"),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
