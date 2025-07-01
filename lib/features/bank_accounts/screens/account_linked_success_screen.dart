import 'package:biopay_mobile/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';
import '../../../widgets/custom_filled_button.dart';

class AccountLinkedSuccessScreen extends StatelessWidget {
  const AccountLinkedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40), // Add some space at the top
            Text(
              "Bank Account Added Successfully!",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Your SBI account ending ****1234 is now linked to your app.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  Assets.onboardingSuccess,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            CustomFilledButton(
              onPressed: () {
                context.go(Routes.landingScreen);
              },
              title: "Continue",
              isExpanded: true,
            ),
          ],
        ),
      ),
    );
  }
}
