import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:biopay_mobile/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CryptoSetUpiScreen extends StatefulWidget {
  const CryptoSetUpiScreen({super.key});

  @override
  State<CryptoSetUpiScreen> createState() => _CryptoSetUpiScreenState();
}

class _CryptoSetUpiScreenState extends State<CryptoSetUpiScreen> {

  final TextEditingController newPinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();

  String newPin = '';
  String confirmPin = '';
  bool isConfirming = false;

  void onKeyTap(String key) {
    setState(() {
      if (key == '⌫') {
        if (isConfirming) {
          if (confirmPin.isNotEmpty) confirmPin = confirmPin.substring(0, confirmPin.length - 1);
        } else {
          if (newPin.isNotEmpty) newPin = newPin.substring(0, newPin.length - 1);
        }
      } else if (RegExp(r'\d').hasMatch(key) && key.length == 1) {
        if (isConfirming && confirmPin.length < 6) {
          confirmPin += key;
        } else if (!isConfirming && newPin.length < 6) {
          newPin += key;
        }
      }

      if (newPin.length == 4 || newPin.length == 6) {
        isConfirming = true;
      }
    });
  }

  Widget buildPinField(String label, String hintValue, TextEditingController ctrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: 8),
        CustomInputField(
          controller: ctrl,
          hintText: hintValue,
        ),
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: 16),
        //   decoration: BoxDecoration(
        //     border: Border.all(color: Colors.white24),
        //     borderRadius: BorderRadius.circular(12),
        //   ),
        //   height: 48,
        //   alignment: Alignment.centerLeft,
        //   child: Text(
        //     value,
        //     style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 4),
        //   ),
        // ),
      ],
    );
  }

  Widget buildKey(String value) {
    return GestureDetector(
      onTap: () => onKeyTap(value),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          value,
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isReadyToContinue = newPin == confirmPin && newPin.length >= 4;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: Text('Set UPI PIN', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create a 4 or 6-digit UPI PIN for secure transactions.',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            SizedBox(height: 24),
            buildPinField("New UPI PIN", newPin, newPinController),
            SizedBox(height: 16),
            buildPinField("Confirm UPI PIN", confirmPin, confirmPinController),
            Spacer(),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 12),
              childAspectRatio: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                ...['1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0', '⌫'].map(buildKey),
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child : SizedBox(
                width: double.infinity,
                child: CustomFilledButton(
                  onPressed: () {
                    context.push(Routes.cryptoConnectScreen);
                  },
                  title: 'Continue',
                  width: SizeUtils.screenWidth,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
