import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../domain/repository.dart';

@Singleton(as: Repository)
class RepositoryImpl extends Repository {
  final Dio client;

  RepositoryImpl({required this.client});

  @override
  String get url => 'http://192.168.1.217';

  List<String> cookies = [];

  final options = Options(
    followRedirects: false,
    validateStatus: (status) => status! < 500,
  );

  @override
  Future<bool> testConnection() async {
    final response = await client.post(
      '$url/login',
      data: {
        'email': 'ruslan@mail.com',
        'password': '123456789',
      },
    );
    print(response.statusCode);
    //print(response.headers);
    print(response.data);
    cookies = response.headers['set-cookie'] ?? [];
    return response.statusCode == 200;
  }

  @override
  Future<bool> addTask() async {
    print(cookies);
    for (final e in cookies) {
      client.options.headers['set-cookie'] = e;
    }
    print(client.options.headers);
    final response = await client.post(
      '$url/add-task',
      data: {
        'name': 'onetask',
        'description': 'description',
        'Time': '2000-01-01',
        'endTime': '2000-01-01',
        'user_id': '1',
        'hidden': 0,
      },
    );
    print(response.statusCode);
    //print(response.headers);
    print(response.data);
    return response.statusCode == 200;
  }
}
