import 'package:flutter/material.dart';

import '../../styles.dart';

class BaseButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? textColor;
  final Color? bgColor;
  final EdgeInsets? padding;

  const BaseButton({
    super.key,
    required this.label,
    this.icon,
    this.textColor,
    this.bgColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 14),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: Styles.shadows,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(icon, size: 20, color: textColor ?? Styles.greyColor),
            ),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: textColor ?? Styles.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
