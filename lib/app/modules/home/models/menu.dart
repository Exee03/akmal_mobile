import 'package:flutter/material.dart';

class Menu {
  Menu({
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final void Function() onPressed;
}
