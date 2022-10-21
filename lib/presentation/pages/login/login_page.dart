import 'package:flutter/material.dart';

export 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  static const name = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('LOGIN'),
      ),
    );
  }
}
