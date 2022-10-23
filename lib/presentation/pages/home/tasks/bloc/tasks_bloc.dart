import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
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
    on<FilterBy>(_filterTasks);
  }

  Future<TasksSuccess> _refreshState(List<TaskModel> tasks) async {
    final user = await _repository.currentUser.first;
    final assigned = tasks.where((e) => e.slaveId == user.id).length;
    final done = tasks.where((e) => e.status == TaskStatus.done).length;

    final hot = tasks.where((e) => e.isHot).length;
    final undone = _tasks.where((e) => e.status != TaskStatus.done).length;

    final percent = (hot / undone * 100).round();

    return TasksSuccess(
      total: tasks.length,
      assigned: assigned,
      done: done,
      undone: undone,
      hot: hot,
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

  void _addTask(AddTask event, Emitter<TasksState> emit) async {
    final duration = TaskDuration.fromString(event.duration);
    final task = TaskModel(
      id: 0,
      name: event.name,
      description: event.description,
      duration: duration,
      endTime: endTime(duration),
      status: event.slaveId != 1 ? TaskStatus.notAssigned : TaskStatus.inWork,
      isHidden: event.isHidden,
      masterId: 1,
      slaveId: event.slaveId,
    );

    try {
      await _repository.addTask(task);
      emit(TaskAddSuccess());
    } on DioError catch (e) {
      emit(TaskAddFail(e.message));
    }
  }

  DateTime endTime(TaskDuration duration) {
    final now = DateTime.now();
    switch (duration) {
      case TaskDuration.day:
        return now.add(const Duration(days: 1));
      case TaskDuration.week:
        return now.add(const Duration(days: 7));
      case TaskDuration.month:
        return now.add(const Duration(days: 31));
      case TaskDuration.quarter:
        return now.add(const Duration(days: 92));
      case TaskDuration.undefined:
        break;
    }
    return now;
  }

  void _filterTasks(FilterBy event, Emitter<TasksState> emit) async {
    emit(await _refreshState(
      _tasks
          .where(
              (e) => e.name.toLowerCase().contains(event.pattern.toLowerCase()))
          .toList(),
    ));
  }

  @override
  Future<void> close() {
    _tasksSubscription?.cancel();
    return super.close();
  }
}
