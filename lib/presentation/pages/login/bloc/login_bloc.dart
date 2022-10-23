import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/model/user_model.dart';
import '../../../../domain/repository.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Repository _repository;

  LoginBloc(this._repository) : super(LoginInitial()) {
    on<LoginAuth>(_auth);
  }

  void _auth(LoginAuth event, Emitter<LoginState> emit) async {
    try {
      final user = await _repository.login(event.login, event.password);
      emit(LoginSuccess(user));
    } on DioError catch (e) {
      emit(LoginError(e.message));
    }
  }
}
