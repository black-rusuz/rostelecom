part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginAuth extends LoginEvent {
  final String login;
  final String password;

  LoginAuth({required this.login, required this.password});
}
