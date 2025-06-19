import 'package:biopay_mobile/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';
import '../model/contact_argument.dart';

class UpiScreen extends StatelessWidget {
  const UpiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UPI',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Action Buttons Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  _buildActionButton(
                    context,
                    Icons.qr_code_scanner,
                    'Scan and Pay',
                    () {

                      context.push(Routes.scanScreen); // pushes onto stack
                    },
                  ),
                  _buildActionButton(
                    context,
                    Icons.person_outline,
                    'Pay Contact',
                    () {
                      context.push(
                        Routes.contactScreen,
                        extra: const ContactArgument(isContactMode: true),
                      );
                    },
                  ),
                  _buildActionButton(
                    context,
                    Icons.account_balance,
                    'Bank Transfer',
                    () {
                      context.push(Routes.bankTransferScreen); // pushes onto stack
                    },
                  ),
                  _buildActionButton(
                    context,
                    Icons.phone_android,
                    'Pay Ph. No.',
                    () {

                      context.push(Routes.paymentScreen); // pushes onto stack
                    },
                  ),
                  _buildActionButton(
                    context,
                    Icons.receipt_long,
                    'Pay Bills',
                    () {},
                  ),
                  _buildActionButton(
                    context,
                    Icons.sync_alt,
                    'Self transfer',
                    () {},
                  ),
                  _buildActionButton(
                    context,
                    Icons.wallet_giftcard,
                    'Receive Money',
                    () {},
                  ),
                  _buildActionButton(
                    context,
                    Icons.mobile_friendly,
                    'Mobile Recharge',
                    () {},
                  ),
                  _buildActionButton(context, Icons.link, 'Link UPI', () {}),
                ],
              ),
              const SizedBox(height: 24.0),
              const Text(
                'People',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Assuming a dark theme based on the image
                ),
              ),
              const SizedBox(height: 16.0),
              // People Section (Placeholder)
              SizedBox(
                height: 200, // Adjust height as needed
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 8, // Placeholder count
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey, // Placeholder color
                            // backgroundImage: AssetImage('assets/images/person${index + 1}.png'), // Placeholder images
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Person ${index + 1}', // Placeholder name
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24.0),
              // Bank Balance and Transaction History
              ListTile(
                leading: const Icon(Icons.account_balance, color: Colors.white),
                title: const Text(
                  'Check bank balance',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16.0,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.history, color: Colors.white),
                title: const Text(
                  'See transaction history',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16.0,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String text,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: buttonBGGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30.0),
            const SizedBox(height: 8.0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
