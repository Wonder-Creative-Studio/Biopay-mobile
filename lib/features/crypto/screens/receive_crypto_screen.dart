import 'package:biopay_mobile/constants/colors.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/basic_app_bar.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';

class ReceiveCryptoScreen extends StatelessWidget {
  const ReceiveCryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Receive Crypto'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Your Wallet Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                    'https://cdn.noitatnemucod.net/thumbnail/300x400/100/9cbcf87f54194742e7686119089478f8.jpg',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Row(
                    children: [
                      const Text('OxAB...123F', style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.copy,
                          size: 20,
                          color: lightGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Container(
                  width: SizeUtils.screenWidth * 0.8,
                  height: SizeUtils.screenWidth * 0.8,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: buttonBGGrey,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Image.network(
                    // 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.pngall.com%2Fwp-content%2Fuploads%2F2%2FQR-Code-Transparent.png&f=1&nofb=1&ipt=0c558fba4dfffd7ca74bda904a254a7f436bb198ef681a7c851d66e8908af37f',
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn3.vectorstock.com%2Fi%2F1000x1000%2F23%2F67%2Fqr-code-the-white-color-icon-vector-15662367.jpg&f=1&nofb=1&ipt=8b651ef95c1fefe59c06480af0a09cfdcd78e23e4d509469d3c096500a610e10',
                    width: SizeUtils.screenWidth * 0.7,
                    height: SizeUtils.screenWidth * 0.7,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            CustomFilledButton(title: 'Share QR code', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
