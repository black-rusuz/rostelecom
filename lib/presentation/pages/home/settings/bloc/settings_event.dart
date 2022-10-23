part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class SetDarkMode extends SettingsEvent {
  final bool isActive;
  final DarkMode darkMode;

  SetDarkMode(this.isActive, this.darkMode);
}

class SetNotification extends SettingsEvent {
  final bool isActive;

  SetNotification(this.isActive);
}


