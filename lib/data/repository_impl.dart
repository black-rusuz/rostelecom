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

  RepositoryImpl({required this.client});

  @override
  String get url => 'http://192.168.1.217/api';

  String token = '';

  Map<String, String> get headers => {
        'Authorization': 'Bearer $token',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
      };

  final debug = Options(validateStatus: (status) => true);

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

    token = response.data['token'];
    client.options.headers = headers;
    final userResponse = await client.get('$url/user');
    debugPrint('CODE ${userResponse.statusCode}\t\tTIME: ${sw.elapsed}');
    //Utils.printJson(userResponse.data, true);

    final user = UserModel.fromJson(userResponse.data);
    currentUser.add(user);
    return user;
  }

  @override
  Future<TaskModel> addTask(TaskModel task) async {
    final sw = Stopwatch()..start();
    debugPrint('ADD TASK');

    client.options.headers = headers;
    final response = await client.post(
      '$url/add-task',
      data: task.toJson(),
      //options: debug,
    );
    debugPrint('CODE ${response.statusCode}\t\tTIME: ${sw.elapsed}');
    //Utils.printJson(response.data, true);

    final newTask = TaskModel.fromJson(response.data['task']);
    getAllTasks();
    return newTask;
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    final sw = Stopwatch()..start();
    debugPrint('ALL TASKS');

    client.options.headers = headers;
    final response = await client.get('$url/all-task');
    debugPrint('CODE ${response.statusCode}\t\tTIME: ${sw.elapsed}');
    //Utils.printJson(response.data, true);

    final newTasks =
        (response.data as List).map((e) => TaskModel.fromJson(e)).toList();
    tasks.add(newTasks);
    return newTasks;
  }

  @override
  Future<NoteModel> addNote(NoteModel note) async {
    final sw = Stopwatch()..start();
    debugPrint('ADD NOTE');

    client.options.headers = headers;
    final response = await client.post(
      '$url/create-note',
      data: note.toJson(),
    );
    debugPrint('CODE ${response.statusCode}\t\tTIME: ${sw.elapsed}');
    //Utils.printJson(response.data, true);

    final newNote = NoteModel.fromJson(response.data['task']);
    getAllNotes();
    return newNote;
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    final sw = Stopwatch()..start();
    debugPrint('ALL TASKS');

    client.options.headers = headers;
    final response = await client.get('$url/list-note');
    debugPrint('CODE ${response.statusCode}\t\tTIME: ${sw.elapsed}');
    //Utils.printJson(response.data, true);

    final newNotes =
        (response.data as List).map((e) => NoteModel.fromJson(e)).toList();
    notes.add(newNotes);
    return newNotes;
  }

  @override
  Future<String> getCsv() async {
    final sw = Stopwatch()..start();
    debugPrint('CSV');

    client.options.headers = headers;
    final response = await client.get('$url/excel');
    debugPrint('CODE ${response.statusCode}\t\tTIME: ${sw.elapsed}');
    //Utils.printJson(response.data, true);

    final csv = response.data;
    return csv;
  }
}
