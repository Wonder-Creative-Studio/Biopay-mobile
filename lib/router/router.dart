import 'package:go_router/go_router.dart';
import '../features/onboarding/screens/splash_screen.dart';
import 'routes.dart';

final router = GoRouter(
  initialLocation: Routes.splashScreen,
  routes: [
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
