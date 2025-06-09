import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? action;

  const CommonAppBar({super.key, this.title,this.action});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // Optional, depending on your design
      elevation: 0, // Optional
      leading: const BackButton(
        color: primaryColor,
      ),
      actions: widget.action,
      title: Text(
        widget.title ?? "Hi, I'm Buzzly!",
        style: const TextStyle(
          color: primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true, // Optional, center the title
    );
  }
}
