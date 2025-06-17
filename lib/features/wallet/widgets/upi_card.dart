import 'package:flutter/material.dart';

class UpiCard extends StatelessWidget {
  final String backgroundAsset;
  final String topRightAsset;
  final Widget topLeftWidget;
  final String bottomCardNumber;
  final String viewTransactionsText;
  final IconData viewTransactionsIcon;
  final VoidCallback? onViewTransactions;
  final String checkBalanceText;
  final IconData checkBalanceIcon;
  final VoidCallback? onCheckBalance;
  final String sendMoneyText;
  final IconData sendMoneyIcon;
  final VoidCallback? onSendMoney;

  const UpiCard({
    super.key,
    required this.backgroundAsset,
    required this.topRightAsset,
    required this.topLeftWidget,
    required this.bottomCardNumber,
    required this.viewTransactionsText,
    required this.viewTransactionsIcon,
    this.onViewTransactions,
    required this.checkBalanceText,
    required this.checkBalanceIcon,
    this.onCheckBalance,
    required this.sendMoneyText,
    required this.sendMoneyIcon,
    this.onSendMoney,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade900, width: 1),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(backgroundAsset, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 20,
                  left: 30,
                  right: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      topLeftWidget,
                      Text(
                        topRightAsset,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Positioned(
                //   bottom: 16,
                //   left: 16,
                //   child: Text(
                //     bottomCardNumber,
                //     style: const TextStyle(
                //       color: Colors.white,
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            height: 102,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade900, width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          onPressed: onViewTransactions,
                          icon: Icon(viewTransactionsIcon, color: Colors.white),
                          label: Text(
                            viewTransactionsText,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      VerticalDivider(color: Colors.grey.shade900, width: 2),
                      Expanded(
                        child: TextButton.icon(
                          onPressed: onCheckBalance,
                          icon: Icon(checkBalanceIcon, color: Colors.white),
                          label: Text(
                            checkBalanceText,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // InkWell(
                //   onTap: onSendMoney,
                //   child: TextButton.icon(
                //     onPressed: onSendMoney,
                //     icon: Icon(sendMoneyIcon, color: Colors.white),
                //     label: Text(
                //       sendMoneyText,
                //       style: const TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: onSendMoney,
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(sendMoneyIcon, color: Colors.white),
                        Text(
                          sendMoneyText,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
