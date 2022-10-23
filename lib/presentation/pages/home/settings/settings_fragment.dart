import 'package:flutter/material.dart';

import '../../../../styles.dart';
import '../../../widgets/base_button.dart';
import '../../../widgets/base_switch.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.73,
      child: Stack(
        children: [
          Column(
            children: const [
              BaseTextSwitch(label: 'Уведомления'),
              SizedBox(height: 15),
              BaseTextSwitch(label: 'Тёмная тема'),
            ],
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BaseButton(
              label: 'Выйти',
              icon: Icons.exit_to_app_rounded,
              textColor: Styles.redColor,
            ),
          )
        ],
      ),
    );
  }
}
