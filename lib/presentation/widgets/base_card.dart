import 'package:flutter/cupertino.dart';

import '../../styles.dart';

class BaseCard extends StatelessWidget {
  final Color? color;
  final Widget child;

  const BaseCard({
    super.key,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: Styles.radius,
      ),
      child: child,
    );
  }
}
