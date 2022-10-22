import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../styles.dart';
import '../../widgets/base_button.dart';
import '../../widgets/base_text_field.dart';
import '../home/home_page.dart';
import 'bloc/login_bloc.dart';

export 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  static const name = '/login';

  LoginPage({super.key});

  final login = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context).pushReplacementNamed(HomePage.name);
        }
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Ошибка авторизации'),
          ));
        }
      },
      child: Scaffold(
        backgroundColor: Styles.accentColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Авторизация',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 30),
                BaseTextField(
                  'Логин',
                  controller: login,
                  icon: const Icon(Icons.person_outline_rounded),
                ),
                const SizedBox(height: 15),
                BaseTextField(
                  'Пароль',
                  controller: password,
                  icon: const Icon(Icons.password_rounded),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => context.read<LoginBloc>().add(LoginAuth(
                        login: login.text,
                        password: password.text,
                      )),
                  child: const BaseButton(
                    label: 'Войти',
                    icon: Icons.login_rounded,
                    bgColor: Styles.darkColor,
                    textColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
