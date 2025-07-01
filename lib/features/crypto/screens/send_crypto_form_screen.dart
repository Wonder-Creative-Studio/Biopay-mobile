import 'package:biopay_mobile/constants/colors.dart';
import 'package:biopay_mobile/widgets/basic_app_bar.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:biopay_mobile/widgets/custom_input_field.dart';
import 'package:biopay_mobile/widgets/custom_dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';

class SendCryptoFormScreen extends StatefulWidget {
  const SendCryptoFormScreen({super.key});

  @override
  State<SendCryptoFormScreen> createState() => _SendCryptoFormScreenState();
}

class _SendCryptoFormScreenState extends State<SendCryptoFormScreen> {
  final TextEditingController walletAddressController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController rupeesController = TextEditingController();
  String selectedGasFeeOption = 'Slow';
  String? selectedToken; // State variable for selected token

  final List<String> cryptoTokens = [
    'Bitcoin',
    'Ethereum',
    'Solana',
    'Dogecoin',
  ]; // Predefined list of tokens

  @override
  void dispose() {
    walletAddressController.dispose();
    amountController.dispose();
    rupeesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Send Crypto'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Recipient Wallet',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CustomInputField(
              controller: walletAddressController,
              hintText: 'Enter Wallet Address',
            ),
            const SizedBox(height: 16),
            const Text(
              'Token',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CustomDropdownField<String>(
              value: selectedToken,
              hintText: 'Select your Token',
              items:
                  cryptoTokens.map((String token) {
                    return DropdownMenuItem<String>(
                      value: token,
                      child: Text(token),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedToken = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Amount',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CustomInputField(
              controller: amountController,
              hintText: 'Enter amount',
              keyBoardType: TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            const Text(
              'Amount in Rupees',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CustomInputField(
              controller: rupeesController,
              hintText: 'Total Amount in Rupees',
              keyBoardType: TextInputType.numberWithOptions(decimal: true),
              readOnly: true,
            ),
            const SizedBox(height: 16),
            const Text(
              'Gas Fee Option',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildGasFeeOption(
                  'Slow',
                  'Low fee',
                  'Takes longer Time',
                  selectedGasFeeOption == 'Slow',
                ), // Assuming Slow is default
                const SizedBox(width: 8),
                _buildGasFeeOption(
                  'Average',
                  'Moderate fee',
                  'Normal speed',
                  selectedGasFeeOption == 'Average',
                ),
                const SizedBox(width: 8),
                _buildGasFeeOption(
                  'Fast',
                  'High fee',
                  'Fast confirm',
                  selectedGasFeeOption == 'Fast',
                ),
              ],
            ),
            const SizedBox(height: 32),
            CustomFilledButton(
              title: 'Preview Transaction',
              onPressed: () {
                context.push(Routes.sendCryptoPreviewScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGasFeeOption(
    String title,
    String fee,
    String time,
    bool isSelected,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedGasFeeOption = title;
          });
        },
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: buttonBGGrey,
            borderRadius: BorderRadius.circular(12.0),
            border:
                isSelected ? Border.all(color: primaryColor, width: 2.0) : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? primaryColor : Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(fee, style: TextStyle(fontSize: 12, color: lightGreyColor)),
              Text(time, style: TextStyle(fontSize: 12, color: lightGreyColor)),
            ],
          ),
        ),
      ),
    );
  }
}
