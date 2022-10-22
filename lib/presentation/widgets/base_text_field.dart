import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const BaseTextField(
    this.label, {
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
