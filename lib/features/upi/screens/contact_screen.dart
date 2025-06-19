import 'package:flutter/material.dart';
import '../model/contact_argument.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/custom_user_tile.dart';
import '../widgets/section_header.dart';

class ContactScreen extends StatefulWidget {
  final ContactArgument argument;

  const ContactScreen({super.key, required this.argument});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';


  final List<Map<String, String>> recentUsers = [
    {
      "name": "Arlene McCoy",
      "phone": "871-565-0100",
      "image": "https://randomuser.me/api/portraits/women/1.jpg"
    },
    {
      "name": "Leslie Alexander",
      "phone": "208-555-0176",
      "image": "https://randomuser.me/api/portraits/women/2.jpg"
    },
    {
      "name": "Devon Lane",
      "phone": "210-555-0187",
      "image": "https://randomuser.me/api/portraits/men/3.jpg"
    },
    {
      "name": "Jenny Wilson",
      "phone": "206-555-0100",
      "image": "https://randomuser.me/api/portraits/women/4.jpg"
    },
  ];

  final List<Map<String, String>> upiUsers = [
    {
      "name": "Kristin Watson",
      "phone": "871-565-0100",
      "image": "https://randomuser.me/api/portraits/men/5.jpg"
    },
    {
      "name": "Dianne Russell",
      "phone": "208-555-0176",
      "image": "https://randomuser.me/api/portraits/women/6.jpg"
    },
    {
      "name": "Annette Black",
      "phone": "829-565-0105",
      "image": "https://randomuser.me/api/portraits/women/7.jpg"
    },
    {
      "name": "Theresa Webb",
      "phone": "129-555-0105",
      "image": "https://randomuser.me/api/portraits/women/8.jpg"
    },
    {
      "name": "Darrell Steward",
      "phone": "129-555-0112",
      "image": "https://randomuser.me/api/portraits/men/9.jpg"
    },
    {
      "name": "Theresa Webb",
      "phone": "129-555-0105",
      "image": "https://randomuser.me/api/portraits/women/8.jpg"
    },
    {
      "name": "Darrell Steward",
      "phone": "129-555-0112",
      "image": "https://randomuser.me/api/portraits/men/9.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    final filteredRecents = _filterList(recentUsers);
    final filteredUpi = _filterList(upiUsers);

    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomSearchBar(
              hintText: widget.argument.isContactMode
                  ? "Search your Contact"
                  : "Enter Mobile Number",
              controller: _searchController,
              onChanged: (val) => setState(() => searchText = val),
            ),
            const SizedBox(height: 20),

            // Replace below with Expanded ListView
            Expanded(
              child: ListView(
                children: [
                  SectionHeader(title: "Recents"),
                  ...filteredRecents.map(_buildUserTile).toList(),

                  if (widget.argument.isContactMode) ...[
                    const SizedBox(height: 20),
                    SectionHeader(title: "All people on UPI",isViewAll: false,),
                    ...filteredUpi.map(_buildUserTile).toList(),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
    foregroundColor: Colors.white,
    title: Text(widget.argument.isContactMode ? "Pay Contact" : "Pay Ph. No."),
    leading: const BackButton(),
  );

  List<Map<String, String>> _filterList(List<Map<String, String>> users) =>
      users.where((user) =>
      user["name"]!.toLowerCase().contains(searchText.toLowerCase()) ||
          user["phone"]!.contains(searchText)).toList();

  Widget _buildUserTile(Map<String, String> user) => CustomUserTile(
    name: user["name"]!,
    phone: user["phone"]!,
    imageUrl: user["image"]!,
    onTap: () {}, // Hook: You can pass onTap logic here
  );
}
