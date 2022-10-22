import 'package:rxdart/rxdart.dart';

import '../data/model/task_model.dart';
import '../data/model/user_model.dart';

abstract class Repository {
  abstract final String url;

  final currentUser = BehaviorSubject<UserModel>();
  final tasks = BehaviorSubject<List<UserModel>>();

  // * PROD
  Future<UserModel> login(String login, String password);

  Future<TaskModel> addTask(TaskModel task);

  Future<List<TaskModel>> getAllTasks();
}
