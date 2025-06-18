import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'constants/theme.dart';
import 'router/router.dart';
import 'utils/size_utils.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SizeUtils sizeUtils = SizeUtils();
    sizeUtils.init(context);
    return GlobalLoaderOverlay(
      overlayWidgetBuilder: (progress) {
        return Center(child: CircularProgressIndicator());
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Bio Pay',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: router,
      ),
    );
  }
}
