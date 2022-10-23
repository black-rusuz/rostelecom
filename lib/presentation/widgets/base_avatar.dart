import 'package:flutter/material.dart';

import '../../styles.dart';

class BaseAvatar extends StatelessWidget {
  final double size;
  final String name;

  const BaseAvatar({
    super.key,
    required this.size,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Styles.darkColor.withOpacity(0.1),
      ),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
            color: Styles.darkColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
