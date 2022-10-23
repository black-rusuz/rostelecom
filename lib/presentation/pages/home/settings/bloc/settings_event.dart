part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class SetDarkMode extends SettingsEvent {
  final bool isActive;

  SetDarkMode(this.isActive);
}

class SetNotification extends SettingsEvent {
  final bool isActive;

  SetNotification(this.isActive);
}
