import 'package:biopay_mobile/constants/assets.dart';
import 'package:biopay_mobile/constants/colors.dart';
import 'package:biopay_mobile/features/pay_bill/model/provider_argument.dart';
import 'package:biopay_mobile/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PayBillScreen extends StatefulWidget {
  const PayBillScreen({super.key});

  @override
  State<PayBillScreen> createState() => _PayBillScreenState();
}

class _PayBillScreenState extends State<PayBillScreen> {

  Widget buildOptionBox(String icon, String title, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: buttonBGGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(icon, color: Colors.white),
            Image.asset(icon, width: 30, height: 30),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Wrap(children: items),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text("Pay Bills", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSection("Recharge", [
                buildOptionBox(Assets.billMobile, "Mobile recharge", (){
                  context.push(Routes.mobileRechargeScreen); // pushes onto stack
                }),
                buildOptionBox(Assets.billDTH, "DTH / Cable TV", (){
                  context.push(Routes.selectDTHScreen, extra: ProviderArgument(name: 'dth')); // pushes onto stack
                }),
                buildOptionBox(Assets.billGoogle, "Google Play", (){
                  context.push(Routes.googlePlayStoreScreen); // pushes onto stack
                }),
              ]),
              buildSection("Utilities", [
                buildOptionBox(Assets.billElectricity, "Electricity Bill", (){
                  context.push(Routes.selectDTHScreen, extra: ProviderArgument(name: 'electric')); // pushes onto stack
                }),
                buildOptionBox(Assets.billWater, "Water Bill", (){
                  context.push(Routes.selectDTHScreen, extra: ProviderArgument(name: 'water')); // pushes onto stack
                }),
                buildOptionBox(Assets.billGas, "Gas Bill", (){
                  context.push(Routes.selectDTHScreen, extra: ProviderArgument(name: 'gas')); // pushes onto stack
                }),
                buildOptionBox(Assets.billBroadband, "Broadband / Landline", (){
                  context.push(Routes.selectDTHScreen, extra: ProviderArgument(name: 'broadband')); // pushes onto stack
                }),
              ]),
              buildSection("Loan", [
                buildOptionBox(Assets.billLoan, "EMI Payment", (){
                  context.push(Routes.selectDTHScreen, extra: ProviderArgument(name: 'emi')); // pushes onto stack
                }),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
