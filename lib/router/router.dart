import 'package:biopay_mobile/features/crypto/screens/crypto_balance_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/crypto_connect_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/crypto_home_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/crypto_otp_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/crypto_set_upi_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/crypto_signin_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/crypto_video_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/crypto_waiting_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/crypto_wallet_setup_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/enter_pin_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/how_add_crypto_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/how_create_meta_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/preview_transection_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/receive_crypto_qr_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/send_crypto_screen.dart';
import 'package:biopay_mobile/features/crypto/screens/what_metatask_screen.dart';
import 'package:biopay_mobile/features/mobile_recharge/screen/mobile_operator_screen.dart';
import 'package:biopay_mobile/features/mobile_recharge/screen/mobile_plandetail_screen.dart';
import 'package:biopay_mobile/features/mobile_recharge/screen/mobile_recharge_screen.dart';
import 'package:biopay_mobile/features/mobile_recharge/screen/mobile_selectplan_screen.dart';
import 'package:biopay_mobile/features/upi/model/payment_argument.dart';
import 'package:biopay_mobile/features/upi/screens/bank_balnace_screen.dart';
import 'package:biopay_mobile/features/upi/screens/enter_upi_pin_screen.dart';
import 'package:biopay_mobile/features/upi/screens/link_your_upi_screen.dart';
import 'package:biopay_mobile/features/upi/screens/receive_money_screen.dart';
import 'package:biopay_mobile/features/upi/screens/transection_histry_screen.dart';
import 'package:biopay_mobile/features/upi/screens/transection_success_screen.dart';
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
import '../features/landing/screens/landing_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/onboarding/screens/splash_screen.dart';
import '../features/upi/model/contact_argument.dart';
import '../features/upi/screens/bank_transfer_screen.dart';
import '../features/upi/screens/contact_screen.dart';
import '../features/upi/screens/payment_screen.dart';
import '../features/upi/screens/scan_screen.dart';
import '../features/upi/screens/upi_screen.dart';
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
    GoRoute(
      path: Routes.upiScreen,
      builder: (context, state) => const UpiScreen(),
    ),
    GoRoute(
      path: Routes.contactScreen,
      builder: (context, state) {
        final args = state.extra as ContactArgument? ?? const ContactArgument(isContactMode: true);
        return ContactScreen(argument: args);
      },
    ),
    GoRoute(
      path: Routes.bankTransferScreen,
      builder: (context, state) {
        return BankTransferScreen();
      },
    ),
    GoRoute(
      path: Routes.scanScreen,
      builder: (context, state) => const ScanScreen(),
    ),
    GoRoute(
      path: Routes.paymentScreen,
      builder: (context, state) {
        final arguments = state.extra as PaymentArguments;
        return PaymentScreen(
          args: arguments,
        );
        },
    ),
    GoRoute(
      path: Routes.enterUpiPinScreen,
      builder: (context, state) => const EnterUpiPinScreen(),
    ),
    GoRoute(
      path: Routes.transectionSuccessScreen,
      builder: (context, state) => const TransactionSuccessScreen(),
    ),
    GoRoute(
      path: Routes.linkYourUpiScreen,
      builder: (context, state) => LinkYourUpiScreen(),
    ),
    GoRoute(
      path: Routes.bankBalanceScreen,
      builder: (context, state) => BankBalnaceScreen(),
    ),
    GoRoute(
      path: Routes.transectionHistryScreen,
      builder: (context, state) => TransectionHistryScreen(),
    ),
    GoRoute(
      path: Routes.receiveMoneyScreen,
      builder: (context, state) => ReceiveMoneyScreen(),
    ),
    GoRoute(
      path: Routes.cryptoVideoScreen,
      builder: (context, state) => CryptoVideoScreen(),
    ),
    GoRoute(
      path: Routes.cryptoWalletSetupScreen,
      builder: (context, state) => CryptoWalletSetupScreen(),
    ),
    GoRoute(
      path: Routes.cryptoSignInScreen,
      builder: (context, state) => CryptoSigninScreen(),
    ),
    GoRoute(
      path: Routes.cryptoOtpScreen,
      builder: (context, state) => CryptoOtpScreen(),
    ),
    GoRoute(
      path: Routes.cryptoWaitingScreen,
      builder: (context, state) => CryptoWaitingScreen(),
    ),
    GoRoute(
      path: Routes.cryptoSetUpiSrceen,
      builder: (context, state) => CryptoSetUpiScreen(),
    ),
    GoRoute(
      path: Routes.cryptoConnectScreen,
      builder: (context, state) => CryptoConnectScreen(),
    ),
    GoRoute(
      path: Routes.cryptoHomeScreen,
      builder: (context, state) => CryptoHomeScreen(),
    ),
    GoRoute(
      path: Routes.cryptoBalanceScreen,
      builder: (context, state) => CryptoBalanceScreen(),
    ),
    GoRoute(
      path: Routes.sendCryptoScreen,
      builder: (context, state) => SendCryptoScreen(),
    ),
    GoRoute(
      path: Routes.previewTransectionScreen,
      builder: (context, state) => PreviewTransectionScreen(),
    ),
    GoRoute(
      path: Routes.enterPinScreen,
      builder: (context, state) => EnterPinScreen(),
    ),
    GoRoute(
      path: Routes.transactionSuccessScreen,
      builder: (context, state) => TransactionSuccessScreen(),
    ),
    GoRoute(
      path: Routes.receiveCryptoQrScreen,
      builder: (context, state) => ReceiveCryptoQrScreen(),
    ),
    GoRoute(
      path: Routes.whatMetataskScreen,
      builder: (context, state) => WhatMetataskScreen(),
    ),
    GoRoute(
      path: Routes.howCreateMetaScreen,
      builder: (context, state) => HowCreateMetaScreen(),
    ),
    GoRoute(
      path: Routes.howAddCryptoScreen,
      builder: (context, state) => HowAddCryptoScreen(),
    ),
    GoRoute(
      path: Routes.mobileRechargeScreen,
      builder: (context, state) => MobileRechargeScreen(),
    ),
    GoRoute(
      path: Routes.mobileOperatorScreen,
      builder: (context, state) => MobileOperatorScreen(),
    ),
    GoRoute(
      path: Routes.mobileSelectPlanScreen,
      builder: (context, state) => MobileSelectplanScreen(),
    ),
    GoRoute(
      path: Routes.mobilePlanDetailScreen,
      builder: (context, state) => MobilePlandetailScreen(),
    ),
  ],
);
