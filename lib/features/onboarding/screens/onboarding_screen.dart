import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/assets.dart';
import '../../../router/routes.dart';
import '../../../widgets/custom_filled_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String title = 'Welcome to Bio Pay';

  String description = 'Simplify Payments with Bio Pay.';

  String buttonText = 'Get Started';

  String image = Assets.onboarding1;

  int index = 0;

  void nextPage(BuildContext context) {
    if (index == 0) {
      setState(() {
        title = 'Spending Insights';
        description = 'Manage funds, cards, and transactions seamlessly.';
        buttonText = 'Next';
        image = Assets.onboarding2;
        index = 1;
      });
    } else if (index == 1) {
      setState(() {
        title = 'Pay Securely Everywhere';
        description =
            'UPI, Aadhaar Pay, and card payments all encrypted and protected.';
        buttonText = 'Next';
        image = Assets.onboarding3;
        index = 2;
      });
    } else if (index == 2) {
      context.go(Routes.landingScreen);
    }
  }

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
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.white70),
            ),
            if (index != 2)
              Expanded(
                child: Center(child: Image.asset(image, fit: BoxFit.contain)),
              ),
            if (index == 2)
              Expanded(
                child: Row(
                  children: [
                    SizedBox(width: 50),
                    Image.asset(
                      image,
                      fit: BoxFit.contain,
                      width: SizeUtils.screenWidth * 0.75,
                    ),
                  ],
                ),
              ),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomFilledButton(
                onPressed: () => nextPage(context),
                title: buttonText,
                isExpanded: false,
                width: 150,
                icon: Icon(Icons.arrow_forward_rounded),
              ),
            ),
            const SizedBox(height: 24), // Add some space at the bottom
          ],
        ),
      ),
    );
  }
}
