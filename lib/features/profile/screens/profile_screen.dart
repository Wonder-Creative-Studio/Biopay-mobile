import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/routes.dart';
import '../../../widgets/basic_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://cdn.noitatnemucod.net/thumbnail/300x400/100/9cbcf87f54194742e7686119089478f8.jpg",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Albert Flores',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'albert@biopay.com',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),

                          InkWell(
                            onTap: () {},
                            child: Icon(Icons.copy, size: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _buildOptions(context),
              const SizedBox(height: 16),
              _buildOptions2(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildOptionItem(
            context,
            Icons.person_outline,
            'Personal Information',
          ),
          _buildOptionItem(context, Icons.qr_code, 'Your QR Code'),
          _buildOptionItem(context, Icons.business_outlined, 'Bank Accounts'),
          _buildOptionItem(context, Icons.receipt_rounded, 'Recent Payments'),
          _buildOptionItem(context, Icons.credit_card, 'Linked Financials'),
          _buildOptionItem(
            context,
            Icons.settings_outlined,
            'Settings',
            onTap: () {
              context.push(Routes.profileSettingsScreen);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptions2(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildOptionItem(context, Icons.help_outline, 'Help & Support'),
          _buildOptionItem(context, Icons.error_outline, 'Report a Problem'),
        ],
      ),
    );
  }

  Widget _buildOptionItem(
    BuildContext context,
    IconData icon,
    String title, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }
}
