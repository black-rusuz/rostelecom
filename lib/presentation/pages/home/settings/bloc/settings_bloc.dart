import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SetNotification>(_setNotification);
    on<SetDarkMode>(_setDarkMode);
  }

  void _setNotification(SetNotification event, Emitter<SettingsState> emit) {}

  void _setDarkMode(SetDarkMode event, Emitter<SettingsState> emit) {}
}
