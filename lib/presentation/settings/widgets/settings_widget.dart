import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? trailingText;
  final VoidCallback onTap;

  const SettingsWidget({
    super.key,
    required this.title,
    required this.icon,
    this.trailingText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black54),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(
              trailingText!,
              style: const TextStyle(color: Colors.black54),
            ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 19),
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}
