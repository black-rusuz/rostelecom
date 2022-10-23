import 'package:flutter/material.dart';

import '../../styles.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;
  final IconData? icon;
  final Color? textColor;
  final Color? bgColor;
  final EdgeInsets? padding;
  final Border? border;

  const BaseButton({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.textColor,
    this.bgColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 14),
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: Styles.shadows,
          border: border,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child:
                    Icon(icon, size: 20, color: textColor ?? Styles.greyColor),
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
      ),
    );
  }
}
