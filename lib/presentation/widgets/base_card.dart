import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final double borderRadius;
  final Color? color;
  final Widget child;

  const BaseCard({
    super.key,
    this.color = Colors.black12,
    this.borderRadius = 10,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
