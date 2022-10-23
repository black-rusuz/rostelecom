import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../domain/repository.dart';
import 'model/note_model.dart';
import 'model/task_model.dart';
import 'model/user_model.dart';
import 'utils.dart';

@Singleton(as: Repository)
class RepositoryImpl extends Repository {
  final Dio client;

  RepositoryImpl({required this.client}) {
    client.options.headers['X-Authorization'] = token;
  }

  @override
  String get url => 'http://192.168.1.217/api';

  String token = '';

  @override
  Future<UserModel> login(String login, String password) async {
    final sw = Stopwatch()..start();
    debugPrint('LOGIN');
    final response = await client.post('$url/auth/login', data: {
      'email': login,
      'password': password,
    });
    debugPrint('CODE ${response.statusCode}\t\tTIME: ${sw.elapsed}');
    Utils.printJson(response.data, true);

    final user = UserModel.fromJson(response.data);
    currentUser.add(user);
    token = response.data['token'];
    debugPrint(token);
    return user;
  }

  @override
  Future<TaskModel> addTask(TaskModel task) async {
    final sw = Stopwatch()..start();
    debugPrint('ADD TASK');

    client.options.headers['Authorization'] = 'Bearer $token';
    final response = await client.post(
      '$url/add-task',
      data: task.toJson(),
    );
    debugPrint('CODE ${response.statusCode}\t\tTIME: ${sw.elapsed}');
    Utils.printJson(response.data, true);

    final newTask = TaskModel.fromJson(response.data['task']);
    getAllTasks();
    return newTask;
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    final sw = Stopwatch()..start();
    debugPrint('ALL TASKS');

    client.options.headers['Authorization'] = 'Bearer $token';
    final response = await client.get('$url/all-task');
    debugPrint('CODE ${response.statusCode}\t\tTIME: ${sw.elapsed}');
    Utils.printJson(response.data, true);

    final newTasks =
        (response.data as List).map((e) => TaskModel.fromJson(e)).toList();
    tasks.add(newTasks);
    return newTasks;
  }

  @override
  Future<NoteModel> addNote(TaskModel task) {
    // TODO: implement addNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteModel>> getAllNotes() {
    // TODO: implement getAllNotes
    throw UnimplementedError();
  }
}
