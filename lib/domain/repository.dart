import 'package:rxdart/rxdart.dart';

import '../data/model/note_model.dart';
import '../data/model/task_model.dart';
import '../data/model/user_model.dart';

abstract class Repository {
  abstract final String url;

  final currentUser = BehaviorSubject<UserModel>();
  final tasks = BehaviorSubject<List<TaskModel>>();
  final notes = BehaviorSubject<List<NoteModel>>();

  // * PROD
  Future<UserModel> login(String login, String password);

  // * TASKS
  Future<TaskModel> addTask(TaskModel task);

  Future<List<TaskModel>> getAllTasks();

  // * NOTES
  Future<NoteModel> addNote(NoteModel note);

  Future<List<NoteModel>> getAllNotes();
}
