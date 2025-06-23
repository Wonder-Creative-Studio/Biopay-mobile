import 'package:flutter/material.dart';

class CryptoScreen extends StatelessWidget {
  const CryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          
        },
        child: Text(
          'Crypto Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
