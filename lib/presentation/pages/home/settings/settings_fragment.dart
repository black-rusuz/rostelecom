import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';
import '../../../../styles.dart';
import '../../../widgets/base_button.dart';
import '../../../widgets/base_switch.dart';
import 'bloc/settings_bloc.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<DarkMode>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.73,
      child: Stack(
        children: [
          Column(
            children: [
              BaseTextSwitch(
                  label: 'Уведомления',
                  onTap: (v) =>
                      context.read<SettingsBloc>().add(SetNotification(v))),
              const SizedBox(height: 15),
              BaseTextSwitch(
                  label: themeMode.darkMode ? 'Сейчас тёмная тема' : 'Сейчас светлая тема',
                  onTap: (v) =>
                      context.read<SettingsBloc>().add(SetDarkMode(v, themeMode))),
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
