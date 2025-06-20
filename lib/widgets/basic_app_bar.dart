import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool centerTitle;
  final double fontSize;
  final String title;

  const BasicAppBar({
    super.key,
    this.centerTitle = true,
    this.fontSize = 22,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: Text(
        title,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
      ),

      // leading: IconButton(
      //   icon: const Icon(Icons.arrow_back),
      //   onPressed: () {
      //     context.pop();
      //   },
      // ),
    );
  }
}
