import 'package:biopay_mobile/features/upi/model/payment_argument.dart';
import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GooglePlayScreen extends StatefulWidget {
  const GooglePlayScreen({super.key});

  @override
  State<GooglePlayScreen> createState() => _GooglePlayScreenState();
}

class _GooglePlayScreenState extends State<GooglePlayScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final List<int> _amountOptions = [100, 250, 400, 500];
  int? _selectedAmount;
  String? amount;

  @override
  void dispose() {
    _emailController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _onAmountSelected(int amount) {
    setState(() {
      _selectedAmount = amount;
      _amountController.text = amount.toString();
    });
  }

  void _onContinue() {
    final email = _emailController.text.trim();
    final amount = _amountController.text.trim();

    // Email validation
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (email.isEmpty) { //|| !emailRegex.hasMatch(email)
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter a valid pay id."))
      );
      return;
    }

    // Amount validation
    if (amount.isEmpty || int.tryParse(amount) == null || int.parse(amount) <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter a valid amount."))
      );
      return;
    }

    // If valid, continue
    context.push(
      Routes.paymentScreen,
      extra: PaymentArguments(
        amt: amount,
        showCardSelectionValue: true,
      ),
    );
  }

  // void _onContinue() {
  //   final email = _emailController.text.trim();
  //   amount = _amountController.text.trim();
  //   print('Email: $email');
  //   print('Amount: $amount');
  //   context.push(Routes.paymentScreen,extra: PaymentArguments(amt: amount ?? '0', showCardSelectionValue: true));
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: Text(
          'Google Play Recharge',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your Google Play email ID',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              style: TextStyle(color: Colors.white),
              decoration: _inputDecoration('Pay id'),
            ),
            SizedBox(height: 30),
            Text(
              'Enter Amount',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              onChanged: (val) => setState(() => _selectedAmount = null),
              decoration: _inputDecoration('00'),
            ),
            SizedBox(height: 15),
            Wrap(
              spacing: 10,
              children: _amountOptions.map((amount) {
                final isSelected = _selectedAmount == amount;
                return GestureDetector(
                  onTap: () => _onAmountSelected(amount),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white24 : Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      amount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomFilledButton(
                onPressed: (){
                  _onContinue();
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

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
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
    );
  }
}
