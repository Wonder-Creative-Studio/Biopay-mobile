import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool centerTitle;
  final double fontSize;
  final String title;
  final List<Widget>? actions;

  const BasicAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.fontSize = 22,
    this.actions,
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
      actions: actions,
    );
  }
}
