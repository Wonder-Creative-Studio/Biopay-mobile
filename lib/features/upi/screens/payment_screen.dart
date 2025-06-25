import 'package:biopay_mobile/constants/assets.dart';
import 'package:biopay_mobile/features/upi/model/BankCard.dart';
import 'package:biopay_mobile/features/upi/model/payment_argument.dart';
import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatefulWidget {
  final PaymentArguments args;
  const PaymentScreen({super.key, required this.args});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String amount = "";
  String note = "";
  final String recipientName = "Esther Howard";
  final String recipientPhone = "+91 98765 43210";

  bool showCardSelection = false;
  bool isCardListExpanded = false;
  BankCard? selectedCard;

  List<BankCard> cards = [
    BankCard(bankName: "SBI Bank", maskedNumber: "************0987", imagePath: Assets.sbiCard),
    BankCard(bankName: "Canara Bank", maskedNumber: "************1234", imagePath: Assets.canraCard),
    BankCard(bankName: "HDFC Bank", maskedNumber: "************5678", imagePath: Assets.hdfcCard),
  ];

  @override
  void initState() {
    super.initState();
    if(widget.args.showCardSelectionValue)
    {
      setState(() {
        showCardSelection = true;
        amount = widget.args.amt;
      });
    }

    if (cards.isNotEmpty) {
      selectedCard = cards[0];
    }
  }

  void _onKeyTap(String value) {
    setState(() {
      if (value == '<') {
        if (amount.isNotEmpty) {
          amount = amount.substring(0, amount.length - 1);
        }
      } else {
        amount += value;
      }
    });
  }

  Widget _buildKeypad() {
    final keys = [
      '1', '2', '3',
      '4', '5', '6',
      '7', '8', '9',
      '.', '0', '<',
    ];

    return GridView.builder(
      shrinkWrap: true,
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.7,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      itemCount: keys.length,
      itemBuilder: (context, index) {
        final key = keys[index];
        return ElevatedButton(
          onPressed: () => _onKeyTap(key),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // <- No corner radius
            ),
          ),
          child: key == '<'
              ? const Icon(Icons.backspace_outlined, color: Colors.white)
              : Text(
            key,
            style: const TextStyle(fontSize: 24),
          ),
        );
      },
    );
  }

  Widget buildCardSelectionView() {
    return Container(
      height: isCardListExpanded == true ? 300 : 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Select card", style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 10),
          if (selectedCard != null)
            ListTile(
              leading: Image.asset(selectedCard!.imagePath, width: 40),
              title: Text(selectedCard!.bankName, style: const TextStyle(color: Colors.white)),
              subtitle: Text(selectedCard!.maskedNumber, style: const TextStyle(color: Colors.grey)),
              trailing: IconButton(
                icon: Icon(
                  isCardListExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isCardListExpanded = !isCardListExpanded;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  isCardListExpanded = !isCardListExpanded;
                });
              },
            )
          else
            ListTile(
              leading: const Icon(Icons.credit_card, color: Colors.white),
              title: const Text("Select a card", style: TextStyle(color: Colors.white)),
              trailing: IconButton(
                icon: Icon(
                  isCardListExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isCardListExpanded = !isCardListExpanded;
                  });
                },
              ),
            ),

          if (isCardListExpanded) ...[
            Expanded(
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  final card = cards[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: selectedCard == card ? Colors.white10 : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Image.asset(card.imagePath, width: 40),
                      title: Text(card.bankName, style: const TextStyle(color: Colors.white)),
                      subtitle: Text(card.maskedNumber, style: const TextStyle(color: Colors.grey)),
                      trailing: selectedCard == card
                          ? const Icon(Icons.check_circle_outline_outlined, color: Colors.white)
                          : null,
                      onTap: () {
                        setState(() {
                          selectedCard = card;
                          isCardListExpanded = false;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ]
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Transfer', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text("Transfer to", style: TextStyle(color: Colors.white54)),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(Assets.bitcoin),
                  radius: 24,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipientName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      recipientPhone,
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "₹${amount.isEmpty ? "0.00" : amount}",
              style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                // Optional: Show dialog or bottom sheet to enter note
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  note.isEmpty ? "Add a note" : note,
                  style: TextStyle(
                    color: note.isEmpty ? Colors.white54 : Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),

          Container(
            color: Colors.grey.shade900,
            child: Column(
              children: [
                SizedBox(height: 24),
                if (!showCardSelection) ...[
                  _buildKeypad(),
                ] else ...[
                  buildCardSelectionView(),
                ],
                Padding(
                  padding: const EdgeInsets.all(20),
                  child : SizedBox(
                    width: double.infinity,
                    child: CustomFilledButton(
                      onPressed: () {
                        // TODO: Implement continue action
                        if (!showCardSelection) {
                          if (amount.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Please enter an amount")),
                              ) as SnackBar,

                            );
                            return;
                          } else {
                            setState(() {
                              showCardSelection = true;
                            });
                          }
                        } else {
                          context.push(Routes.enterUpiPinScreen);
                        }
                      },
                      title: showCardSelection == false ? 'Continue' : 'Transfer',
                      width: SizeUtils.screenWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // _buildKeypad(),
        ],
      ),
    );
  }
}
