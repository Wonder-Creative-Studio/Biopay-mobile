import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';
import '../../../widgets/basic_app_bar.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_input_field.dart';

class SetUpiPinScreen extends StatefulWidget {
  const SetUpiPinScreen({super.key});

  @override
  State<SetUpiPinScreen> createState() => _SetUpiPinScreenState();
}

class _SetUpiPinScreenState extends State<SetUpiPinScreen> {
  final TextEditingController _newPinController = TextEditingController();
  final TextEditingController _confirmPinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "Set UPI PIN"),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create a 4 or 6-digit UPI PIN for secure transactions.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Text("New UPI PIN", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            CustomInputField(
              controller: _newPinController,
              hintText: "654451",
              keyBoardType: TextInputType.number,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            Text(
              "Confirm UPI PIN",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            CustomInputField(
              controller: _confirmPinController,
              hintText: "654451",
              keyBoardType: TextInputType.number,
              obscureText: true,
            ),
            const SizedBox(height: 24),
            CustomFilledButton(
              onPressed: () {
                context.push(Routes.accountLinkedSuccessScreen);
              },
              title: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
