import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  bool? isViewAll;

  SectionHeader({super.key, required this.title, this.isViewAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
          Visibility(
              visible: isViewAll ?? true,
              child: const Text("View All", style: TextStyle(color: Colors.grey, fontSize: 14))),
        ],
      ),
    );
  }
}
