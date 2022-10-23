import 'package:flutter/material.dart';

import '../../styles.dart';
import 'base_card.dart';

class BaseTextSwitch extends StatefulWidget {
  final String label;

  const BaseTextSwitch({super.key, required this.label});

  @override
  State<BaseTextSwitch> createState() => _BaseTextSwitchState();
}

class _BaseTextSwitchState extends State<BaseTextSwitch> {
  bool isActive = false;

  void onChanged(bool value) => setState(() => isActive = value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            BaseCard(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    Switch(value: isActive, onChanged: onChanged)
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
