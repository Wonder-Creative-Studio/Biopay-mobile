import 'package:biopay_mobile/features/pay_bill/model/select_provider_argument.dart';
import 'package:biopay_mobile/features/upi/model/payment_argument.dart';
import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectProviderScreen extends StatefulWidget {
  final SelectProviderArgument args;
  SelectProviderScreen({super.key, required this.args});

  @override
  State<SelectProviderScreen> createState() => _SelectProviderScreenState();
}

class _SelectProviderScreenState extends State<SelectProviderScreen> {
  final TextEditingController _cardNumberController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    super.dispose();
  }

  void _onContinuePressed() {
    final cardNumber = _cardNumberController.text.trim();
    // Handle validation or navigation here
    print("Smart Card Number: $cardNumber");

    if(widget.args.name == 'dth') {
      context.push(Routes.mobileSelectPlanScreen); // pushes onto stack
    } else {
      context.push(Routes.paymentScreen,extra: PaymentArguments(amt: '299', showCardSelectionValue: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: Text(
          'Select Service Provider',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey.shade800,
                  child: Icon(Icons.tv, color: Colors.white), // Replace with logo if available
                ),
                SizedBox(width: 12),
                Text(
                  'Sun Direct',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'Enter your Smart Card Number',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _cardNumberController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: '48984187185',
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.grey.shade900,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade700),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomFilledButton(
                onPressed: (){
                  _onContinuePressed();
                },
                title: 'Continue',
                width: SizeUtils.screenWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
