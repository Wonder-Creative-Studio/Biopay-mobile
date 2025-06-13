import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_input_field.dart';
import '../../../widgets/custom_dropdown_field.dart';

class MerchantSignupScreen extends StatefulWidget {
  const MerchantSignupScreen({super.key});

  @override
  State<MerchantSignupScreen> createState() => _MerchantSignupScreenState();
}

class _MerchantSignupScreenState extends State<MerchantSignupScreen> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController gstinController = TextEditingController();

  bool isAgreed = false;
  String? selectedBusinessType;

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
              "Create Your\nMerchant Account",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Tell us about your business to get started.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  // Added SingleChildScrollView
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
                      Text("Business Name", style: TextStyle(fontSize: 14)),
                      SizedBox(height: 8),
                      CustomInputField(
                        controller: businessNameController,
                        hintText: "Enter your business name",
                      ),
                      const SizedBox(height: 16),
                      Text("Email (Optional)", style: TextStyle(fontSize: 14)),
                      SizedBox(height: 8),
                      CustomInputField(
                        controller: emailController,
                        hintText: "Enter your email",
                      ),
                      const SizedBox(height: 16),
                      Text("Business Type", style: TextStyle(fontSize: 14)),
                      SizedBox(height: 8),
                      CustomDropdownField<String>(
                        value: selectedBusinessType,
                        hintText: "Select your business type",
                        items:
                            <String>['Retail', 'Service', 'Other'].map((
                              String value,
                            ) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedBusinessType = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "GSTIN/ Registration",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      CustomInputField(
                        controller: gstinController,
                        hintText: "Enter GSTIN or Reg. No.",
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
                        title: "Sign Up as Merchant",
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
                          onPressed: () {
                            context.push(Routes.signUpScreen);
                          },
                          child: Text(
                            "Here to pay only? Sign up as User",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () => context.push(Routes.loginScreen),
                          child: Text(
                            "Already have a merchant account? Sign in",
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
