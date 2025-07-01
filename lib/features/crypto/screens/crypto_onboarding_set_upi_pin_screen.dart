import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/routes.dart';
import '../../../widgets/basic_app_bar.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_input_field.dart';

class CryptoOnboardingSetUpiPinScreen extends StatelessWidget {
  CryptoOnboardingSetUpiPinScreen({super.key});

  final TextEditingController newPinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "Set UPI PIN"),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              "Create a 4 or 6-digit UPI PIN for secure transactions.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Text("New UPI PIN", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            CustomInputField(
              controller: newPinController,
              hintText: "Enter New UPI PIN",
              keyBoardType: TextInputType.number,
              obscureText: true,
            ),
            const SizedBox(height: 24),
            Text(
              "Confirm UPI PIN",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            CustomInputField(
              controller: confirmPinController,
              hintText: "Confirm UPI PIN",
              keyBoardType: TextInputType.number,
              obscureText: true,
            ),
            const Expanded(
              child: SizedBox(),
            ), // Spacer to push button to bottom
            CustomFilledButton(
              onPressed: () {
                context.push(Routes.cryptoOnboardingWalletConnectedScreen);
              },
              title: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
