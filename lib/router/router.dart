import 'package:go_router/go_router.dart';
import '../features/authentication/models/otp_screen_arguments.dart';
import '../features/authentication/screens/aadhar_kyc_screen.dart';
import '../features/authentication/screens/login_screen.dart';
import '../features/authentication/screens/merchant_signup_screen.dart';
import '../features/authentication/screens/otp_screen.dart';
import '../features/authentication/screens/signup_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/onboarding/screens/splash_screen.dart';
import 'routes.dart';

final router = GoRouter(
  initialLocation: Routes.splashScreen,
  routes: [
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.onboardingScreen,
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: Routes.loginScreen,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: Routes.otpScreen,
      builder: (context, state) {
        final arguments = state.extra as OtpScreenArguments;
        return OtpScreen(
          args: arguments,
        );
      },
    ),
    GoRoute(
      path: Routes.signUpScreen,
      builder: (context, state) => SignupScreen(),
    ),
    GoRoute(
      path: Routes.merchantSignupScreen,
      builder: (context, state) => MerchantSignupScreen(),
    ),
    GoRoute(
      path: Routes.aadharKycScreen,
      builder: (context, state) => AadharKycScreen(),
    ),
  ],
);
