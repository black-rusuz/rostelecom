import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../domain/repository.dart';
import 'model/user_model.dart';

@Singleton(as: Repository)
class RepositoryImpl extends Repository {
  final Dio client;

  RepositoryImpl({required this.client}) {
    client.options.headers['X-Authorization'] = token;
  }

  @override
  String get url => 'http://192.168.1.217';

  // TODO: get from login
  String token =
      '1A2ClBaodzKVMOxoNY3BHep7QCbPzjebxGBlpIPfjK9HEVUhdIFmxrxIpghmij3G';

  @override
  Future<bool> testConnection() async {
    final sw = Stopwatch()..start();
    debugPrint('TEST');
    final response = await client.post(
      '$url/login',
      data: {
        'email': 'ruslan@mail.com',
        'password': '123456789',
      },
    );
    debugPrint('${response.statusCode}: ${sw.elapsed}');
    debugPrint(response.data.toString());
    return response.statusCode == 200;
  }

  @override
  Future<bool> addTask() async {
    final sw = Stopwatch()..start();
    debugPrint('TEST ADD');
    final response = await client.post(
      '$url/add-task',
      data: {
        'name': 'onetask',
        'description': 'description',
        'time': '2000-01-01',
        'endTime': '2000-01-01',
        'userId': '1',
        'hidden': 0,
      },
    );
    debugPrint('${response.statusCode}: ${sw.elapsed}');
    debugPrint(response.data.toString());
    return response.statusCode == 200;
  }

  @override
  Future<UserModel> login(String login, String password) async {
    final sw = Stopwatch()..start();
    debugPrint('LOGIN');
    final response = await client.post(
      '$url/login',
      data: {
        'email': login,
        'password': password,
      },
    );
    final user = UserModel.fromJson(response.data);
    currentUser.add(user);
    debugPrint('CODE ${response.statusCode}, TIME: ${sw.elapsed}');
    return user;
  }
}
