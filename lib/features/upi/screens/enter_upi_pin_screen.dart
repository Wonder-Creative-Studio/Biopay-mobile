import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EnterUpiPinScreen extends StatefulWidget {
  const EnterUpiPinScreen({super.key});

  @override
  State<EnterUpiPinScreen> createState() => _EnterUpiPinScreenState();
}

class _EnterUpiPinScreenState extends State<EnterUpiPinScreen> {
  List<String> pin = ['', '', '', '', '', ''];

  void onKeyboardTap(String value) {
    for (int i = 0; i < pin.length; i++) {
      if (pin[i].isEmpty) {
        setState(() {
          pin[i] = value;
        });
        break;
      }
    }
  }

  void onBackspaceTap() {
    for (int i = pin.length - 1; i >= 0; i--) {
      if (pin[i].isNotEmpty) {
        setState(() {
          pin[i] = '';
        });
        break;
      }
    }
  }

  void onContinue() {
    final enteredPin = pin.join();
    if (enteredPin.length == 6) {
      // Handle PIN submission
      print("Entered PIN: $enteredPin");
      context.push(Routes.transectionSuccessScreen);

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter 6-digit PIN")),
      );
    }
  }

  Widget buildPinBox(String value) {
    return Container(
      width: 50,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        value.isNotEmpty ? '*' : '',
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }

  Widget buildKeyboardButton(String value, {VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed ?? () => onKeyboardTap(value),
      child: Container(
        alignment: Alignment.center,
        // color: Colors.white24,
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.white24),
        //   borderRadius: BorderRadius.circular(12),
        //   color: Colors.transparent,
        // ),
        child: Text(
          value,
          style: const TextStyle(fontSize: 26, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Enter UPI PIN",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 60),

            // PIN Boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pin.map((value) => buildPinBox(value)).toList(),
            ),

            const Spacer(),

            // Numeric Keypad
            Container(
              color: Colors.grey.shade900,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 2,
                      children: [
                        ...List.generate(9, (index) {
                          return buildKeyboardButton('${index + 1}');
                        }),
                        buildKeyboardButton('.', onPressed: () {}), // Placeholder
                        buildKeyboardButton('0'),
                        GestureDetector(
                          onTap: onBackspaceTap,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Icon(Icons.backspace, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomFilledButton(
                        onPressed: onContinue,
                        title: 'Continue',
                        width: SizeUtils.screenWidth,
                      ),
                    ),
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
