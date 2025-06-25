import 'package:biopay_mobile/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileRechargeScreen extends StatefulWidget {
  const MobileRechargeScreen({super.key});

  @override
  State<MobileRechargeScreen> createState() => _MobileRechargeScreenState();
}

class _MobileRechargeScreenState extends State<MobileRechargeScreen> {
  final TextEditingController _phoneController = TextEditingController();

  final List<Map<String, String>> rechargeHistory = [
    {
      "name": "Darrell Steward",
      "number": "9050450545",
      "image": "https://i.pravatar.cc/150?img=1"
    },
    {
      "name": "Jenny Wilson",
      "number": "984521578",
      "image": "https://i.pravatar.cc/150?img=2"
    },
    {
      "name": "Courtney Henry",
      "number": "1543154522",
      "image": "https://i.pravatar.cc/150?img=3"
    },
  ];
  List<Map<String, String>> filteredHistory = [];

  @override
  void initState() {
    super.initState();
    filteredHistory = rechargeHistory; // initialize with full list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Mobile Recharge',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter Mobile Number", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: '+91 0000000000',
                      hintStyle: TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white30),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        filteredHistory = rechargeHistory.where((contact) {
                          final numberMatch = contact['number']!.contains(value);
                          final nameMatch = contact['name']!.toLowerCase().contains(value.toLowerCase());
                          return numberMatch || nameMatch;
                        }).toList();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white30),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.person_outline, color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recharge History", style: TextStyle(color: Colors.white, fontSize: 16)),
                Text("View All", style: TextStyle(color: Colors.white54)),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredHistory.length,
                itemBuilder: (context, index) {
                  final item = filteredHistory[index];
                  return ListTile(
                    onTap: (){
                      context.push(Routes.mobileOperatorScreen); // pushes onto stack
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item['image']!),
                    ),
                    title: Text(item['name']!, style: TextStyle(color: Colors.white)),
                    subtitle: Text(item['number']!, style: TextStyle(color: Colors.white60)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
