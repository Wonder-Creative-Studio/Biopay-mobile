import 'package:biopay_mobile/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileSelectplanScreen extends StatefulWidget {
  const MobileSelectplanScreen({super.key});

  @override
  State<MobileSelectplanScreen> createState() => _MobileSelectplanScreenState();
}

class _MobileSelectplanScreenState extends State<MobileSelectplanScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  late List<String> tabArr = ['Popular', 'True 5G', 'Yearly Plans', 'Entertainment'];

  final List<Map<String, String>> allPlans = List.generate(
    6,
        (index) => {
      "amount": "299",
      "title": "2GB | 28 Days | Unlimited Calls",
      "desc": "Unlimited 5G data, Unlimited Voice Calling, Validity 29 Days, 2GB High Speed data...",
    },
  );
  List<Map<String, String>> filteredPlans = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabArr.length, vsync: this);
    filteredPlans = allPlans;
  }

  void _filterPlans(String query) {
    setState(() {
      filteredPlans = allPlans
          .where((plan) =>
      plan['title']!.toLowerCase().contains(query.toLowerCase()) ||
          plan['amount']!.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Select Recharge Plan',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: TextField(
              controller: _searchController,
              onChanged: _filterPlans,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for plan or amount',
                hintStyle: const TextStyle(color: Colors.white38),
                prefixIcon: const Icon(Icons.search, color: Colors.white38),
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white30),
                ),
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white38,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(text: "Popular"),
              Tab(text: "True 5G"),
              Tab(text: "Yearly Plans"),
              Tab(text: "Entertainment"),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredPlans.length,
              itemBuilder: (context, index) {
                final plan = filteredPlans[index];
                return GestureDetector(
                  onTap: (){
                    context.push(Routes.mobilePlanDetailScreen); // pushes onto stack
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plan['amount']!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plan['title']!,
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                plan['desc']!,
                                style: const TextStyle(color: Colors.white60, fontSize: 12),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.open_in_new, color: Colors.white38, size: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
