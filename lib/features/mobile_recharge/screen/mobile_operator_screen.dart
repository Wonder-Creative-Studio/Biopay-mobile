import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileOperatorScreen extends StatefulWidget {
  const MobileOperatorScreen({super.key});

  @override
  State<MobileOperatorScreen> createState() => _MobileOperatorScreenState();
}

class _MobileOperatorScreenState extends State<MobileOperatorScreen> {
  String selectedOperator = 'BSNL';
  String selectedCircle = 'KERALA';

  final List<String> operators = ['BSNL', 'Jio', 'Airtel', 'Vi'];
  final List<String> circles = ['KERALA', 'DELHI', 'MUMBAI', 'KARNATAKA'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Mobile Operator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'), // Replace with your image source
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Darrell Steward',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      '9050450545',
                      style: TextStyle(color: Colors.white60),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white30),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                dropdownColor: Colors.black,
                value: selectedOperator,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(color: Colors.white, fontSize: 16),
                items: operators
                    .map((op) => DropdownMenuItem(
                  value: op,
                  child: Text(op),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedOperator = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white30),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                dropdownColor: Colors.black,
                value: selectedCircle,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(color: Colors.white, fontSize: 16),
                items: circles
                    .map((circle) => DropdownMenuItem(
                  value: circle,
                  child: Text(circle),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCircle = value!;
                  });
                },
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child : SizedBox(
                width: double.infinity,
                child: CustomFilledButton(
                  onPressed: () {
                    context.push(Routes.mobileSelectPlanScreen);
                  },
                  title: "Continue",
                  width: SizeUtils.screenWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
