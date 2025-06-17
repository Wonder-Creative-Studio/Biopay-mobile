import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String userGreeting;
  final Widget? userAvatar;
  final VoidCallback? onNotificationTap;

  const CommonAppBar({
    super.key,
    required this.userName,
    this.userGreeting = "Hey,",
    this.userAvatar,
    this.onNotificationTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child:
            userAvatar ??
            const CircleAvatar(radius: 30, child: Icon(Icons.person)),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userGreeting, style: TextStyle(fontSize: 14)),
          Text(
            userName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Badge(
            child: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: 25,
            ),
          ),
          onPressed: onNotificationTap,
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
