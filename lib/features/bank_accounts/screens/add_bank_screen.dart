import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import '../../../router/routes.dart';
import '../../../widgets/basic_app_bar.dart';

class AddBankScreen extends StatelessWidget {
  const AddBankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "Bank Accounts"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select bank account to transfer from',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _buildBankAccountItem(
                    context,
                    'SBI Bank',
                    'XXXXXXXX0987',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBankAccountItem(
    BuildContext context,
    String bankName,
    String accountNumber, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap?.call();
        showVerificationSheet(context);
        Timer(Duration(seconds: 3), () {
          context.push(Routes.selectAccountScreen);
          context.pop();
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                "https://figma.com/file/xveqSVy3z3OsZDZNmGzgLc/image/2db5272ea8105b129f0a88e902677a750c9f26d3",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 24),
            Text(
              bankName,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void showVerificationSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      enableDrag: false,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Verifying Your Bank Account",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 24),
              SpinKitPulsingGrid(color: Theme.of(context).primaryColor),
              const SizedBox(height: 24),
              const Text(
                "We are fetching accounts linked to your mobile number. Please wait...",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
