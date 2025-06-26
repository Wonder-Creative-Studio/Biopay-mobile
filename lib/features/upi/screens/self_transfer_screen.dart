import 'package:flutter/material.dart';
import 'package:biopay_mobile/router/routes.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colors.dart';
import '../../../widgets/basic_app_bar.dart';
import '../../../widgets/custom_filled_button.dart';

class SelfTransferScreen extends StatefulWidget {
  const SelfTransferScreen({super.key});

  @override
  State<SelfTransferScreen> createState() => _SelfTransferScreenState();
}

class _SelfTransferScreenState extends State<SelfTransferScreen> {
  String? _selectedFromAccount;
  String? _selectedToAccount;

  bool isToCollapsed = false;
  bool isFromCollapsed = false;

  final List<Map<String, String>> _bankAccounts = [
    {
      'name': 'SBI Bank',
      'number': 'XXXXXXXX0987',
      'logo': 'assets/images/bank_logo.png',
    },
    {
      'name': 'HDFC Bank',
      'number': 'XXXXXXXX0987',
      'logo': 'assets/images/bank_logo.png',
    },
    {
      'name': 'Canara Bank',
      'number': 'XXXXXXXX0987',
      'logo': 'assets/images/bank_logo.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Self Transfer'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAccountSection(
                      title: 'Select bank account to transfer from',
                      accounts: _bankAccounts,
                      selectedAccount: _selectedFromAccount,
                      onAccountSelected: (account) {
                        setState(() {
                          _selectedFromAccount = account;
                        });
                      },
                      isCollapsed: isFromCollapsed,
                      onToggleCollapsible: () {
                        setState(() {
                          isFromCollapsed = !isFromCollapsed;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    _buildAccountSection(
                      title: 'Select bank account to transfer to',
                      accounts: _bankAccounts,
                      selectedAccount: _selectedToAccount,
                      onAccountSelected: (account) {
                        setState(() {
                          _selectedToAccount = account;
                        });
                      },
                      isCollapsed: isToCollapsed,
                      onToggleCollapsible: () {
                        setState(() {
                          isToCollapsed = !isToCollapsed;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CustomFilledButton(
                title: 'Next',
                onPressed: () {
                  if (_selectedFromAccount != null &&
                      _selectedToAccount != null) {
                    context.push(
                      Routes.selfTransferEnterAmountScreen,
                      extra: {
                        'fromAccount': _bankAccounts.firstWhere(
                          (acc) => acc['name'] == _selectedFromAccount,
                        ),
                        'toAccount': _bankAccounts.firstWhere(
                          (acc) => acc['name'] == _selectedToAccount,
                        ),
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSection({
    required String title,
    required List<Map<String, String>> accounts,
    required String? selectedAccount,
    required ValueChanged<String> onAccountSelected,
    required VoidCallback? onToggleCollapsible,
    required bool isCollapsed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onToggleCollapsible,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Icon(
                isCollapsed ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade800),
          ),
          child:
              isCollapsed && selectedAccount != null
                  ? _buildBankAccountItem(
                    context,
                    accounts.firstWhere(
                      (acc) => acc['name'] == selectedAccount,
                    ),
                    true,
                    onAccountSelected,
                  )
                  : isCollapsed && selectedAccount == null
                  ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Please select an account",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                  : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: accounts.length,
                    itemBuilder: (context, index) {
                      final account = accounts[index];
                      final bool isSelected =
                          selectedAccount == account['name'];
                      return _buildBankAccountItem(
                        context,
                        account,
                        isSelected,
                        onAccountSelected,
                      );
                    },
                  ),
        ),
      ],
    );
  }

  Widget _buildBankAccountItem(
    BuildContext context,
    Map<String, String> account,
    bool isSelected,
    ValueChanged<String> onAccountSelected,
  ) {
    return InkWell(
      onTap: () => onAccountSelected(account['name']!),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            Image.asset(account['logo']!, width: 40, height: 40),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account['name']!,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  account['number']!,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            const Spacer(),
            if (isSelected) const Icon(Icons.check_circle, color: primaryColor),
          ],
        ),
      ),
    );
  }
}
