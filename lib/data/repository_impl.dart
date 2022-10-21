import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../domain/repository.dart';

@Singleton(as: Repository)
class RepositoryImpl extends Repository {
  final Dio client;

  RepositoryImpl({required this.client}) {
    client.options.headers = headers;
  }

  @override
  String get url => 'http://192.168.1.217';

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

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
    print(response.headers);
    print(response.data);
    return response.statusCode == 200;
  }
}
