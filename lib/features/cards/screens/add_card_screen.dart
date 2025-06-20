import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_input_field.dart';

class AddCardScreen extends StatelessWidget {
  AddCardScreen({super.key});

  final TextEditingController cardholderNameController =
      TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryMonthController = TextEditingController();
  final TextEditingController expiryYearController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add New Card"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: SizeUtils.screenHeight * 0.80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      "Cardholder Name",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    CustomInputField(
                      controller: cardholderNameController,
                      hintText: "Enter cardholder's full name",
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Card Number",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    CustomInputField(
                      controller: cardNumberController,
                      hintText: "Enter 16-digit card number",
                      keyBoardType: TextInputType.number,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Expiry Date (MM/YY)",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: CustomInputField(
                            controller: expiryMonthController,
                            hintText: "MM",
                            keyBoardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomInputField(
                            controller: expiryYearController,
                            hintText: "YY",
                            keyBoardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "CVV Code",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    CustomInputField(
                      controller: cvvController,
                      hintText: "Enter Your CVV Code",
                      keyBoardType: TextInputType.number,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  CustomFilledButton(onPressed: () {}, title: "Continue"),
                  const SizedBox(height: 16),
                  CustomFilledButton(
                    onPressed: () {
                      context.pop();
                    },
                    title: "Cancel",
                    backgroundColor:
                        Colors
                            .grey[800], // Example for a different button style
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
