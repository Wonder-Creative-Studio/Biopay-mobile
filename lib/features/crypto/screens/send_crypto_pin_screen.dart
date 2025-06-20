import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../router/routes.dart';
import '../../../utils/size_utils.dart';
import '../../../widgets/basic_app_bar.dart';
import '../../../widgets/custom_filled_button.dart';

class SendCryptoPinScreen extends StatefulWidget {
  const SendCryptoPinScreen({super.key});

  @override
  State<SendCryptoPinScreen> createState() => _SendCryptoPinScreenState();
}

class _SendCryptoPinScreenState extends State<SendCryptoPinScreen> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode pinFocusNode = FocusNode();

  @override
  void initState() {
    pinFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Enter PIN'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Pinput(
                focusNode: pinFocusNode,
                controller: pinController,
                length: 6,
                obscureText: true,
                defaultPinTheme: PinTheme(
                  width: SizeUtils.screenWidth * 0.12,
                  height: SizeUtils.screenWidth * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                  ),
                  textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            CustomFilledButton(
              title: 'Continue',
              onPressed: () {
                context.push(Routes.sendCryptoSuccessScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
