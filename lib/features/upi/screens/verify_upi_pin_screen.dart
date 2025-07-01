import 'package:biopay_mobile/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import '../../../router/routes.dart';
import '../../../widgets/basic_app_bar.dart';
import '../../../widgets/custom_filled_button.dart';

class VerifyUpiPinScreen extends StatefulWidget {
  final Map<String, String> fromAccount;
  final Map<String, String> toAccount;
  final String amount;

  const VerifyUpiPinScreen({
    super.key,
    required this.fromAccount,
    required this.toAccount,
    required this.amount,
  });

  @override
  State<VerifyUpiPinScreen> createState() => _VerifyUpiPinScreenState();
}

class _VerifyUpiPinScreenState extends State<VerifyUpiPinScreen> {
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 52,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: greyColor),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.grey.shade800,
      ),
      textStyle: defaultPinTheme.textStyle?.copyWith(color: Colors.white),
    );

    return Scaffold(
      appBar: BasicAppBar(title: 'Enter UPI PIN'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10),
              Pinput(
                length: 6,
                controller: _pinController,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                obscureText: true,
                obscuringWidget: Icon(Icons.star_rounded, size: 12),
                showCursor: true,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    context.push(Routes.landingScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
