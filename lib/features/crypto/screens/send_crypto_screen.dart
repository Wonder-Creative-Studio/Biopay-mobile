import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SendCryptoScreen extends StatefulWidget {
  const SendCryptoScreen({super.key});

  @override
  State<SendCryptoScreen> createState() => _SendCryptoScreenState();
}

class _SendCryptoScreenState extends State<SendCryptoScreen> {
  final TextEditingController walletController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController inrController = TextEditingController();

  final List<String> tokens = ['ETH', 'USDT', 'BTC'];
  String? selectedToken;

  String selectedGasFee = 'Average';

  Widget _buildTextField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white54),
            filled: true,
            fillColor: const Color(0xFF1A1A1A),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildGasFeeOption(String label, String desc) {
    final isSelected = selectedGasFee == label;
    return GestureDetector(
      onTap: () {
        setState(() => selectedGasFee = label);
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white12 : Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade700,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Text(label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 4),
            Text(
              desc,
              style: const TextStyle(color: Colors.white54, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Send Crypto", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField("Recipient Wallet", "Enter Wallet Address", walletController),

            // Token Dropdown
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Token", style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    value: selectedToken,
                    hint: const Text("Select your Token", style: TextStyle(color: Colors.white54)),
                    dropdownColor: Colors.black,
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: const TextStyle(color: Colors.white),
                    items: tokens.map((String token) {
                      return DropdownMenuItem<String>(
                        value: token,
                        child: Text(token),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => selectedToken = value);
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),

            _buildTextField("Amount", "Enter amount", amountController),
            _buildTextField("Amount in Rupees", "Total Amount in Rupees", inrController),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Gas Fee Option", style: TextStyle(color: Colors.white70)),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildGasFeeOption("Slow", "Low fee\nTakes longer Time"),
                _buildGasFeeOption("Average", "Moderate fee\nNormal speed"),
                _buildGasFeeOption("Fast", "High fee\nFast confirm"),
              ],
            ),

            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child : SizedBox(
                width: double.infinity,
                child: CustomFilledButton(
                  onPressed: () {
                    context.push(Routes.previewTransectionScreen);
                  },
                  title: "Preview Transaction",
                  width: SizeUtils.screenWidth,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
