import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/model/task_model.dart';
import '../../../../../domain/repository.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

@injectable
class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final Repository _repository;

  List<TaskModel> _tasks = [];

  StreamSubscription? _tasksSubscription;

  TasksBloc(this._repository) : super(TasksInitial()) {
    on<TasksInit>(_init);
    on<TasksFetched>(
        (event, emit) async => emit(await _refreshState(event.tasks)));

    on<AddTask>(_addTask);
  }

  Future<TasksSuccess> _refreshState(List<TaskModel> tasks) async {
    final user = await _repository.currentUser.first;
    final assigned = tasks.where((e) => e.slaveId == user.id).length;
    final done = tasks.where((e) => e.status == TaskStatus.done).length;
    final percent = (assigned * 100 / done).round();

    return TasksSuccess(
      total: tasks.length,
      assigned: assigned,
      done: done,
      percent: percent,
      tasks: tasks,
    );
  }

  void _init(TasksInit event, Emitter<TasksState> emit) async {
    final tasks = await _repository.getAllTasks();
    _refreshState(tasks);
    _tasksSubscription?.cancel();
    _tasksSubscription = _repository.tasks.stream.listen((v) {
      _tasks = v;
      add(TasksFetched(_tasks));
    });
  }

  void _addTask(AddTask event, Emitter<TasksState> emit) {
    //_repository.addTask(TaskModel(
    //  id: 0,
    //  name: 'Different Name',
    //  description: 'Lorem zalupa ipsum',
    //  duration: TaskDuration.day,
    //  endTime: DateTime.now(),
    //  status: TaskStatus.notAssigned,
    //  isHidden: false,
    //  masterId: 0,
    //  slaveId: null,
    //));
  }

  @override
  Future<void> close() {
    _tasksSubscription?.cancel();
    return super.close();
  }
}
