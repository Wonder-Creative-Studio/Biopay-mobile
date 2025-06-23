import 'package:biopay_mobile/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransectionHistryScreen extends StatefulWidget {
  const TransectionHistryScreen({super.key});

  @override
  State<TransectionHistryScreen> createState() =>
      _TransectionHistryScreenState();
}

class _TransectionHistryScreenState extends State<TransectionHistryScreen> {
  final List<Map<String, dynamic>> transactions = [
    {
      "name": "Spotify",
      "time": "2 hours ago",
      "amount": 124.00,
      "isExpense": true,
      "icon": Icons.music_note,
    },
    {
      "name": "Dribbble",
      "time": "2 days ago",
      "amount": 96.00,
      "isExpense": true,
      "icon": Icons.sports_basketball,
    },
    {
      "name": "Spotify",
      "time": "2 hours ago",
      "amount": 124.00,
      "isExpense": true,
      "icon": Icons.music_note,
    },
    {
      "name": "Dribbble",
      "time": "2 days ago",
      "amount": 96.00,
      "isExpense": false,
      "icon": Icons.sports_basketball,
    },
    {
      "name": "Spotify",
      "time": "2 hours ago",
      "amount": 124.00,
      "isExpense": true,
      "icon": Icons.music_note,
    },
    {
      "name": "Dribbble",
      "time": "2 days ago",
      "amount": 96.00,
      "isExpense": true,
      "icon": Icons.sports_basketball,
    },
    {
      "name": "Spotify",
      "time": "2 hours ago",
      "amount": 124.00,
      "isExpense": true,
      "icon": Icons.music_note,
    },
    {
      "name": "Spotify",
      "time": "2 hours ago",
      "amount": 124.00,
      "isExpense": true,
      "icon": Icons.music_note,
    },
    {
      "name": "Dribbble",
      "time": "2 days ago",
      "amount": 96.00,
      "isExpense": true,
      "icon": Icons.sports_basketball,
    },
    {
      "name": "Spotify",
      "time": "2 hours ago",
      "amount": 124.00,
      "isExpense": true,
      "icon": Icons.music_note,
    },
    {
      "name": "Dribbble",
      "time": "2 days ago",
      "amount": 96.00,
      "isExpense": false,
      "icon": Icons.sports_basketball,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          'Transactions History',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final tx = transactions[index];
          return teansectionBuildWidget(tx);
        },
      ),
    );
  }

  Widget teansectionBuildWidget(Map<String, dynamic> tx) {
    return GestureDetector(
      onTap: (){
        context.push(Routes.receiveMoneyScreen);
      },
      child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade700,
                  child: Icon(tx['icon'], color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        tx['time'],
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      tx['isExpense']
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: tx['isExpense'] ? Colors.red : Colors.green,
                    ),
                    Text(
                      '₹${tx['amount'].toStringAsFixed(2)}',
                      style: TextStyle(
                        color: tx['isExpense'] ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
