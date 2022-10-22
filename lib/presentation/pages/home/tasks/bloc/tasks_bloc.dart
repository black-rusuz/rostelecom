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

  TasksBloc(this._repository) : super(TasksInitial()) {
    on<AddTask>(_addTask);
  }

  void _addTask(AddTask event, Emitter<TasksState> emit) {
    _repository.addTask(TaskModel(
      id: 0,
      name: 'Different Name',
      description: 'Lorem zalupa ipsum',
      duration: TaskDuration.day,
      endTime: DateTime.now(),
      status: TaskStatus.notAssigned,
      isHidden: false,
      masterId: 0,
      slaveId: null,
    ));
  }
}
