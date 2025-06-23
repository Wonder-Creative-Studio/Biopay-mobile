import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LinkYourUpiScreen extends StatefulWidget {
  @override
  _LinkYourUpiScreenState createState() => _LinkYourUpiScreenState();
}

class _LinkYourUpiScreenState extends State<LinkYourUpiScreen> {
  final List<String> banks = ['SBI', 'HDFC', 'ICICI', 'Axis Bank', 'Canara Bank'];
  String? selectedBank;
  final TextEditingController mobileController = TextEditingController();
  final String upiId = "albertflores@biopay";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: const Text(
          "Link Your UPI Account",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Bank Name", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white30),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Colors.grey[900],
                  value: selectedBank,
                  hint: const Text("Select Bank Name", style: TextStyle(color: Colors.white54)),
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  items: banks.map((bank) {
                    return DropdownMenuItem<String>(
                      value: bank,
                      child: Text(bank, style: TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedBank = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Mobile Number", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 8),
            TextField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Enter mobile number",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Generate UPI ID", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 8),
            TextField(
              enabled: false,
              controller: TextEditingController(text: upiId),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: upiId,
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white30),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white30),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomFilledButton(
                onPressed: (){
                  if (selectedBank == null || mobileController.text.isEmpty) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please complete all fields."),
                      ),
                    );
                    return;
                  } else {
                    context.push(Routes.bankBalanceScreen);
                  }
                  // Proceed with linking UPI
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
