import 'package:flutter/material.dart';

import '../../styles.dart';

class BaseCard extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double borderRadius;
  final Color color;
  final Widget child;
  final Border? border;

  const BaseCard({
    super.key,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.color = Colors.black12,
    this.borderRadius = 10,
    this.border,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: Styles.shadows,
      ),
      child: child,
    );
  }
}
