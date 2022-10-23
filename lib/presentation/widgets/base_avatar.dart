import 'package:flutter/material.dart';

import '../../styles.dart';

class BaseButton extends StatelessWidget {
  final double size;
  final String name;

  const BaseButton({
    super.key,
    required this.size,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: Styles.darkColor.withOpacity(0.1),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Text(
        name,
        style: const TextStyle(
          color: Styles.darkColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
