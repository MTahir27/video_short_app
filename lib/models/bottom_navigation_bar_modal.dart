import 'package:flutter/material.dart';

class BottomNavigationBarModal {
  final String title;
  final IconData icon;
  final Widget page;
  final bool? isButton;
  final int index;

  BottomNavigationBarModal({
    required this.title,
    required this.icon,
    required this.page,
    this.isButton = false,
    required this.index,
  });
}
