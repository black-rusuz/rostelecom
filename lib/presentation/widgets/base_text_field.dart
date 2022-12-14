import 'package:flutter/material.dart';

import '../../styles.dart';

class BaseTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Icon? icon;
  final int? lines;

  const BaseTextField(
    this.label, {
    super.key,
    this.controller,
    this.onChanged,
    this.icon,
    this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: Styles.shadows,
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14),
        maxLines: lines ?? 1,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: label,
          hintStyle: const TextStyle(color: Styles.greyColor),
        ),
      ),
    );
  }
}
