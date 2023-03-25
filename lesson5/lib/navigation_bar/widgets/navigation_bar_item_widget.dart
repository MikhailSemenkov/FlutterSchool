import 'package:flutter/material.dart';

class NavigationItemWidget extends StatelessWidget {
  const NavigationItemWidget({
    super.key,
    required this.selectedIcon,
    required this.icon,
    required this.label,
  });

  final IconData selectedIcon;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: Icon(selectedIcon, color: Colors.white),
      icon: Icon(icon, color: Colors.grey),
      label: label,
    );
  }
}
