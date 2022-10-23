import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';
import 'base_card.dart';

class BaseTextSwitch extends StatefulWidget {
  final String label;
  final ValueChanged<bool> onTap;

  const BaseTextSwitch({super.key, required this.label, required this.onTap});

  @override
  State<BaseTextSwitch> createState() => _BaseTextSwitchState();
}

class _BaseTextSwitchState extends State<BaseTextSwitch> {
  bool isActive = false;

  void onChanged(bool value) {
    setState(() => isActive = value);
    widget.onTap(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            BaseCard(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.label,
                      style: const TextStyle(
                        color: Styles.secondaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CupertinoSwitch(value: isActive, onChanged: onChanged)
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
