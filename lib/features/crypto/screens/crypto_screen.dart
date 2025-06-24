import 'package:biopay_mobile/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CryptoScreen extends StatelessWidget {
  const CryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          context.push(Routes.cryptoVideoScreen);
        },
        child: Text(
          'Crypto Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
