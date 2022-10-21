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

  Map<String, String> get headers => {};

  @override
  Future<bool> testConnection() async {
    final response = await client.post(
      url,
      data: {
        'username': 'ruslan@mail.com',
        'password': '123456789',
      },
    );
    return (response.statusCode == 200 && response.data.contains('aaaaa'));
  }
}
