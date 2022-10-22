import 'package:flutter/material.dart';

import '../../../../styles.dart';
import '../../../widgets/base_button.dart';
import '../../../widgets/base_card.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: const [
            BaseTextSwitch(label: 'Уведомления'),
            SizedBox(height: 15),
            BaseTextSwitch(label: 'Тёмная тема'),
          ],
        ),
        SizedBox(height: 15),
        const BaseButton(
          label: 'Выйти',
          icon: Icons.exit_to_app_rounded,
          textColor: Styles.redColor,
        )
      ],
    );
  }
}

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
