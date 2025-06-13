import 'package:biopay_mobile/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';
import '../../../widgets/custom_filled_button.dart';

class OnboardingSuccess extends StatelessWidget {
  const OnboardingSuccess({super.key});

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
              "You're All Set!",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Your Bio Pay account is ready to go.\nStart managing your money securely and easily.",
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
              onPressed: () {},
              title: "Take me to my Wallet",
              isExpanded: true,
            ),
          ],
        ),
      ),
    );
  }
}
