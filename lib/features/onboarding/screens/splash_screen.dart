import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/assets.dart';
import '../../../router/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      context.go(Routes.onboardingScreen);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: SizeUtils.screenHeight * 0.4,
              left: 0,
              right: 0,
              child: Center(child: Image.asset(Assets.textLogo, height: 100)),
            ),
            Positioned(
              top: SizeUtils.screenHeight * 0.8,
              left: 0,
              right: 0,
              child: SpinKitCircle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
