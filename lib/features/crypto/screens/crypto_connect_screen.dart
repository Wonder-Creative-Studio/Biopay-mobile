import 'package:biopay_mobile/constants/assets.dart';
import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CryptoConnectScreen extends StatefulWidget {
  const CryptoConnectScreen({super.key});

  @override
  State<CryptoConnectScreen> createState() => _CryptoConnectScreenState();
}

class _CryptoConnectScreenState extends State<CryptoConnectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Wallet Connected!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your wallet has been successfully connected to Bio Pay.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: Center(
                  child: Image.asset(
                    Assets.cryptoSuccess, // Replace with your image path
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child : SizedBox(
                  width: double.infinity,
                  child: CustomFilledButton(
                    onPressed: () {
                      context.push(Routes.cryptoHomeScreen);
                    },
                    title: 'Continue',
                    width: SizeUtils.screenWidth,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
