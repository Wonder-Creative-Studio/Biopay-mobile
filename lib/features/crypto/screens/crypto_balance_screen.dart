import 'package:flutter/material.dart';

class CryptoBalanceScreen extends StatefulWidget {
  const CryptoBalanceScreen({super.key});

  @override
  State<CryptoBalanceScreen> createState() => _CryptoBalanceScreenState();
}

class _CryptoBalanceScreenState extends State<CryptoBalanceScreen> {
  final List<Map<String, String>> tokenData = [
    {"symbol": "ETH", "icon": "🪙", "balance": "0.543", "inr": "₹1,45,200"},
    {"symbol": "USDT", "icon": "🪙", "balance": "100.00", "inr": "₹8,300"},
    {"symbol": "BTC", "icon": "🪙", "balance": "0.005", "inr": "₹15,000"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Crypto Balances', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Wallet Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MetaMask Connected',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Wallet\n0xAB...123F',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: const [
                        Icon(Icons.refresh, color: Colors.white70),
                        SizedBox(width: 8),
                        Text(
                          'Refresh Wallet',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Your Tokens",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),

            // Token Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Token", style: TextStyle(color: Colors.white70)),
                Text("Balance", style: TextStyle(color: Colors.white70)),
                Text("In ₹", style: TextStyle(color: Colors.white70)),
              ],
            ),
            const SizedBox(height: 12),

            // Token List
            ...tokenData.map((token) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(token["symbol"]!, style: const TextStyle(color: Colors.white)),
                    Text(token["balance"]!, style: const TextStyle(color: Colors.white)),
                    Text(token["inr"]!, style: const TextStyle(color: Colors.white)),
                  ],
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
