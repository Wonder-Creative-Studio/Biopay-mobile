import 'package:flutter/material.dart';

class CustomUserTile extends StatelessWidget {
  final String name;
  final String phone;
  final String imageUrl;
  final VoidCallback? onTap;

  const CustomUserTile({
    super.key,
    required this.name,
    required this.phone,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name, style: TextStyle(color: Colors.white)),
      subtitle: Text(phone, style: TextStyle(color: Colors.grey)),
    );
  }
}
