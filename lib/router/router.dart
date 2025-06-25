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
import '../features/cards/screens/card_details_screen.dart';
import '../features/cards/screens/cards_screen.dart';
import '../features/cards/screens/add_card_screen.dart';
import '../features/cards/screens/card_transactions_history_screen.dart';
import '../features/crypto/screens/crypto_onboarding_getting_started_screen.dart';
import '../features/crypto/screens/crypto_onboarding_wallet_setup_screen.dart';
import '../features/crypto/screens/crypto_onboarding_authorization_required_screen.dart';
import '../features/crypto/screens/crypto_onboarding_connect_wallet_screen.dart';
import '../features/crypto/screens/crypto_onboarding_waiting_for_approval_screen.dart';
import '../features/crypto/screens/crypto_onboarding_set_upi_pin_screen.dart';
import '../features/crypto/screens/crypto_onboarding_wallet_connected_screen.dart';
import '../features/crypto/screens/crypto_balance_screen.dart';
import '../features/crypto/screens/crypto_transaction_history_screen.dart';
import '../features/crypto/screens/receive_crypto_screen.dart';
import '../features/crypto/screens/send_crypto_form_screen.dart';
import '../features/crypto/screens/send_crypto_preview_screen.dart';
import '../features/crypto/screens/send_crypto_pin_screen.dart';
import '../features/crypto/screens/send_crypto_success_screen.dart';
import '../features/crypto/screens/metamask_what_is_screen.dart';
import '../features/crypto/screens/metamask_create_account_screen.dart';
import '../features/crypto/screens/metamask_add_crypto_screen.dart';
import '../features/insights/screens/insights_screen.dart';
import '../features/insights/screens/set_budget_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/profile/screens/profile_settings_screen.dart';
import '../features/upi/screens/upi_screen.dart';
import '../features/onboarding/screens/splash_screen.dart';
import '../features/landing/screens/landing_screen.dart';
import '../features/bank_accounts/screens/bank_accounts_screen.dart';
import '../features/bank_accounts/screens/add_bank_screen.dart';
import '../features/bank_accounts/screens/select_account_screen.dart';
import '../features/bank_accounts/screens/verify_account_screen.dart';
import 'routes.dart';
import '../features/bank_accounts/screens/set_upi_pin_screen.dart';
import '../features/bank_accounts/screens/account_linked_success_screen.dart';

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
        return OtpScreen(args: arguments);
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
      builder: (context, state) {
        final selectedIndex = state.extra as int? ?? 0;
        return LandingScreen(selectedIndex: selectedIndex);
      },
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
      path: Routes.cardsScreen,
      builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: Routes.cardDetailsScreen,
      builder: (context, state) => const CardDetailsScreen(),
    ),
    GoRoute(
      path: Routes.addCardScreen,
      builder: (context, state) => AddCardScreen(),
    ),
    GoRoute(
      path: Routes.cardTransactionsHistoryScreen,
      builder: (context, state) => const CardTransactionsHistoryScreen(),
    ),
    GoRoute(
      path: Routes.cryptoOnboardingGettingStartedScreen,
      builder: (context, state) => const CryptoOnboardingGettingStartedScreen(),
    ),
    GoRoute(
      path: Routes.cryptoOnboardingWalletSetupScreen,
      builder: (context, state) => const CryptoOnboardingWalletSetupScreen(),
    ),
    GoRoute(
      path: Routes.cryptoOnboardingAuthorizationRequiredScreen,
      builder:
          (context, state) =>
              const CryptoOnboardingAuthorizationRequiredScreen(),
    ),
    GoRoute(
      path: Routes.cryptoOnboardingConnectWalletScreen,
      builder: (context, state) => CryptoOnboardingConnectWalletScreen(),
    ),
    GoRoute(
      path: Routes.cryptoOnboardingWaitingForApprovalScreen,
      builder:
          (context, state) => const CryptoOnboardingWaitingForApprovalScreen(),
    ),
    GoRoute(
      path: Routes.cryptoOnboardingSetUpiPinScreen,
      builder: (context, state) => CryptoOnboardingSetUpiPinScreen(),
    ),
    GoRoute(
      path: Routes.cryptoOnboardingWalletConnectedScreen,
      builder:
          (context, state) => const CryptoOnboardingWalletConnectedScreen(),
    ),
    GoRoute(
      path: Routes.cryptoBalanceScreen,
      builder: (context, state) => const CryptoBalanceScreen(),
    ),
    GoRoute(
      path: Routes.cryptoTransactionHistoryScreen,
      builder: (context, state) => const CryptoTransactionHistoryScreen(),
    ),
    GoRoute(
      path: Routes.receiveCryptoScreen,
      builder: (context, state) => const ReceiveCryptoScreen(),
    ),
    GoRoute(
      path: Routes.sendCryptoFormScreen,
      builder: (context, state) => const SendCryptoFormScreen(),
    ),
    GoRoute(
      path: Routes.sendCryptoPreviewScreen,
      builder: (context, state) => const SendCryptoPreviewScreen(),
    ),
    GoRoute(
      path: Routes.sendCryptoPinScreen,
      builder: (context, state) => const SendCryptoPinScreen(),
    ),
    GoRoute(
      path: Routes.sendCryptoSuccessScreen,
      builder: (context, state) => const SendCryptoSuccessScreen(),
    ),
    GoRoute(
      path: Routes.metamaskWhatIsScreen,
      builder: (context, state) => const MetamaskWhatIsScreen(),
    ),
    GoRoute(
      path: Routes.metamaskCreateAccountScreen,
      builder: (context, state) => const MetamaskCreateAccountScreen(),
    ),
    GoRoute(
      path: Routes.metamaskAddCryptoScreen,
      builder: (context, state) => const MetamaskAddCryptoScreen(),
    ),
    GoRoute(
      path: Routes.profileScreen,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: Routes.profileSettingsScreen,
      builder: (context, state) => const ProfileSettingsScreen(),
    ),
    GoRoute(
      path: Routes.bankAccountsScreen,
      builder: (context, state) => const BankAccountsScreen(),
    ),
    GoRoute(
      path: Routes.addBankScreen,
      builder: (context, state) => const AddBankScreen(),
    ),
    GoRoute(
      path: Routes.selectAccountScreen,
      builder: (context, state) => const SelectAccountScreen(),
    ),
    GoRoute(
      path: Routes.verifyAccountScreen,
      builder: (context, state) => const VerifyAccountScreen(),
    ),
    GoRoute(
      path: Routes.setUpiPinScreen,
      builder: (context, state) => const SetUpiPinScreen(),
    ),
    GoRoute(
      path: Routes.accountLinkedSuccessScreen,
      builder: (context, state) => const AccountLinkedSuccessScreen(),
    ),
  ],
);
