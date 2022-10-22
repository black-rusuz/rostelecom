import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Icon? icon;

  const BaseTextField(
    this.label, {
    super.key,
    this.controller,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: label,
      ),
    );
  }
}
