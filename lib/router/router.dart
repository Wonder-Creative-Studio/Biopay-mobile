import 'package:go_router/go_router.dart';
import '../features/authentication/models/otp_screen_arguments.dart';
import '../features/authentication/screens/aadhar_kyc_screen.dart';
import '../features/authentication/screens/link_bank_account_screen.dart';
import '../features/authentication/screens/login_screen.dart';
import '../features/authentication/screens/merchant_signup_screen.dart';
import '../features/authentication/screens/onboarding_success.dart';
import '../features/authentication/screens/otp_screen.dart';
import '../features/authentication/screens/signup_screen.dart';
import '../features/authentication/screens/upload_documents_screen.dart';
import '../features/insights/screens/insights_screen.dart';
import '../features/insights/screens/set_budget_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/onboarding/screens/splash_screen.dart';
import '../features/landing/screens/landing_screen.dart';
import 'routes.dart';

final router = GoRouter(
  initialLocation: Routes.landingScreen,
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
    GoRoute(
      path: Routes.linkBankAccountScreen,
      builder: (context, state) => LinkBankAccountScreen(),
    ),
    GoRoute(
      path: Routes.uploadDocumentsScreen,
      builder: (context, state) => UploadDocumentsScreen(),
    ),
    GoRoute(
      path: Routes.onboardingSuccess,
      builder: (context, state) => OnboardingSuccess(),
    ),
    GoRoute(
      path: Routes.landingScreen,
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      path: Routes.insightsScreen,
      builder: (context, state) => const InsightsScreen(),
    ),
    GoRoute(
      path: Routes.setBudgetScreen,
      builder: (context, state) => const SetBudgetScreen(),
    ),
  ],
);
