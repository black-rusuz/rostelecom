import 'package:rxdart/rxdart.dart';

import '../data/model/user_model.dart';

abstract class Repository {
  abstract final String url;

  final currentUser = BehaviorSubject<UserModel>();

  // * TEST
  Future<bool> testConnection();

  Future<bool> addTask();

  // * PROD
  Future<UserModel> login(String login, String password);
}
