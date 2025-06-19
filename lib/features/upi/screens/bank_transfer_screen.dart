import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../utils/size_utils.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_outlined_button.dart';
import '../widgets/custom_user_tile.dart';
import '../widgets/section_header.dart';

class BankTransferScreen extends StatelessWidget {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();

  final List<Map<String, String>> recentUsers = [
    {
      "name": "Arlene McCoy",
      "phone": "(671) 555-0110",
      "image": "https://randomuser.me/api/portraits/men/11.jpg"
    },
    {
      "name": "Leslie Alexander",
      "phone": "(208) 555-0112",
      "image": "https://randomuser.me/api/portraits/men/12.jpg"
    },
    {
      "name": "Devon Lane",
      "phone": "(270) 555-0117",
      "image": "https://randomuser.me/api/portraits/men/13.jpg"
    },
    {
      "name": "Jenny Wilson",
      "phone": "(205) 555-0100",
      "image": "https://randomuser.me/api/portraits/women/14.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Bank Transfer"),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildInputField("Account Number", "Enter account number", accountController),
            const SizedBox(height: 16),
            _buildInputField("IFSC Code", "Enter IFSC code", ifscController),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: CustomFilledButton(

                onPressed: () {
                  // TODO: Implement continue action
                },title: "Continue",
                width: SizeUtils.screenWidth,
              ),
            ),
            const SizedBox(height: 30),
            SectionHeader(title: "Recents"),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: recentUsers.length,
                itemBuilder: (context, index) {
                  final user = recentUsers[index];
                  return CustomUserTile(
                    name: user["name"]!,
                    phone: user["phone"]!,
                    imageUrl: user["image"]!,
                    onTap: () {
                      // TODO: Implement user selection action
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white38),
            filled: true,
            fillColor: Colors.transparent,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white24),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
