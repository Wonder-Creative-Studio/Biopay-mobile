import 'package:flutter/material.dart';
import '../../../widgets/common_app_bar.dart';
import '../../wallet/screens/wallet_screen.dart';
import '../../upi/screens/upi_screen.dart';
import '../../cards/screens/cards_screen.dart';
import '../../crypto/screens/crypto_screen.dart';
import '../../insights/screens/insights_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const WalletScreen(),
    const UpiScreen(),
    const CardsScreen(),
    const CryptoScreen(),
    const InsightsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppBar(
          userName: 'Albert Flores',
          userAvatar: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              "https://cdn.noitatnemucod.net/thumbnail/300x400/100/9cbcf87f54194742e7686119089478f8.jpg",
            ),
          ),
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF1A1A1A),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.shade600,
            unselectedIconTheme: IconThemeData(
              color: Colors.grey.shade600,
              size: 20,
            ),
            selectedIconTheme: IconThemeData(color: Colors.white, size: 20),
            selectedLabelStyle: TextStyle(color: Colors.white, fontSize: 12),
            unselectedLabelStyle: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.paypal_rounded),
                label: 'UPI',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.credit_card),
                label: 'Cards',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.currency_bitcoin_rounded),
                label: 'Crypto',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.insights),
                label: 'Insights',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
