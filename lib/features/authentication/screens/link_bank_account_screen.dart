import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';
import '../../../utils/size_utils.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_input_field.dart';
import '../../../widgets/custom_outlined_button.dart'; // Import CustomOutlinedButton

class LinkBankAccountScreen extends StatefulWidget {
  const LinkBankAccountScreen({super.key});

  @override
  State<LinkBankAccountScreen> createState() => _LinkBankAccountScreenState();
}

class _LinkBankAccountScreenState extends State<LinkBankAccountScreen> {
  final TextEditingController accountHolderNameController =
      TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();

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
              "Link Your\nBank Account",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Add your business bank details\nto receive payouts.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Text("Account Holder Name", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    CustomInputField(
                      controller: accountHolderNameController,
                      hintText: "Enter account holder's name",
                    ),
                    const SizedBox(height: 16),
                    Text("Account Number", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    CustomInputField(
                      controller: accountNumberController,
                      hintText: "Enter account number",
                      keyBoardType:
                          TextInputType
                              .number, // Assuming account number is numeric
                    ),
                    const SizedBox(height: 16),
                    Text("IFSC Code", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    CustomInputField(
                      controller: ifscCodeController,
                      hintText: "Enter IFSC code",
                    ),
                    const SizedBox(height: 40),
                    CustomFilledButton(
                      onPressed: () {
                        context.push(Routes.uploadDocumentsScreen);
                      },
                      title: "Verify Bank",
                    ),
                    const SizedBox(height: 16),
                    CustomOutlinedButton(
                      onPressed: () {
                        context.push(Routes.uploadDocumentsScreen);
                      },
                      width: SizeUtils.screenWidth,
                      title: "Skip for Now",
                      backgroundColor: Colors.grey.shade900,
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
