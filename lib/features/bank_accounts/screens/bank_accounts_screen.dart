import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/routes.dart';
import '../../../widgets/basic_app_bar.dart';

class BankAccountsScreen extends StatelessWidget {
  const BankAccountsScreen({super.key});

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
              const SizedBox(height: 16),
              CustomFilledButton(
                onPressed: () {
                  context.push(Routes.addBankScreen);
                },
                title: "Add Bank Account",
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
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://figma.com/file/xveqSVy3z3OsZDZNmGzgLc/image/2db5272ea8105b129f0a88e902677a750c9f26d3",
                width: 100,
                height: 56,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bankName,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  accountNumber,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
