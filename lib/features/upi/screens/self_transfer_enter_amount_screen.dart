import 'package:biopay_mobile/widgets/custom_input_field.dart';
import 'package:biopay_mobile/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colors.dart';
import '../../../widgets/basic_app_bar.dart';
import '../../../widgets/custom_filled_button.dart';

class SelfTransferEnterAmountScreen extends StatefulWidget {
  final Map<String, String> fromAccount;
  final Map<String, String> toAccount;

  const SelfTransferEnterAmountScreen({
    super.key,
    required this.fromAccount,
    required this.toAccount,
  });

  @override
  State<SelfTransferEnterAmountScreen> createState() =>
      _SelfTransferEnterAmountScreenState();
}

class _SelfTransferEnterAmountScreenState
    extends State<SelfTransferEnterAmountScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  bool addNote = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Self Transfer'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAccountInfo('Transfer from', widget.fromAccount),
            const SizedBox(height: 16),
            _buildAccountInfo('Transfer to', widget.toAccount),
            const Spacer(),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  if (value[0] != '₹') {
                    _amountController.text = "₹$value";
                  }
                });
              },
              decoration: const InputDecoration(
                fillColor: Colors.transparent,
                border: InputBorder.none,
                hintText: '₹0.00',
                hintStyle: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            if (!addNote)
              CustomFilledButton(
                onPressed: () {
                  setState(() {
                    addNote = true;
                  });
                },
                title: "Add a Note",
                backgroundColor: buttonBGGrey2,
                width: 120,
              ),
            if (addNote)
              CustomInputField(

                controller: _noteController,
                hintText: "Add Note",
              ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  if (_amountController.text.isNotEmpty) {
                    context.push(
                      Routes.verifyUpiPinScreen,
                      extra: {
                        'fromAccount': widget.fromAccount,
                        'toAccount': widget.toAccount,
                        'amount': _amountController.text,
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountInfo(String label, Map<String, String> account) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 8),
        Row(
          children: [
            Image.asset(account['logo']!, width: 90, height: 50),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account['name']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  account['number']!,
                  style: const TextStyle(color: lightGreyColor, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
