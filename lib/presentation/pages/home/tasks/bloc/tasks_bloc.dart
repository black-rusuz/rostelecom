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
    emit(TasksSuccess(
      total: 0,
      assigned: 0,
      done: 0,
      percent: 0,
      tasks: [
        TaskModel(
          id: 0,
          name: 'Создать приложение для хакатона',
          description: 'Lorem zalupa ipsum',
          duration: TaskDuration.day,
          endTime: DateTime.now(),
          status: TaskStatus.notAssigned,
          isHidden: false,
          masterId: 0,
          slaveId: null,
        ),
        TaskModel(
          id: 1,
          name: 'Сделать дизайн приложения',
          description: 'Lorem zalupa ipsum',
          duration: TaskDuration.week,
          endTime: DateTime.now().add(const Duration(days: 1)),
          status: TaskStatus.notAssigned,
          isHidden: false,
          masterId: 0,
          slaveId: null,
        ),
        TaskModel(
          id: 2,
          name: 'Какая-то скрытая задача',
          description: 'Lorem zalupa ipsum',
          duration: TaskDuration.month,
          endTime: DateTime.now().add(const Duration(days: 5)),
          status: TaskStatus.notAssigned,
          isHidden: false,
          masterId: 0,
          slaveId: null,
        ),
        TaskModel(
          id: 3,
          name: 'Авторизация',
          description: 'Lorem zalupa ipsum',
          duration: TaskDuration.quarter,
          endTime: DateTime.now().add(const Duration(days: 40)),
          status: TaskStatus.notAssigned,
          isHidden: false,
          masterId: 0,
          slaveId: null,
        ),
      ],
    ));
  }
}
