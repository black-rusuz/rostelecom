part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

class TasksInitial extends TasksState {}

class TasksSuccess extends TasksState {
  final int total;
  final int assigned;
  final int done;
  final int percent;
  final List<TaskModel> tasks;

  const TasksSuccess({
    required this.total,
    required this.assigned,
    required this.done,
    required this.percent,
    required this.tasks,
  });

  @override
  List<Object> get props => [
        total,
        assigned,
        done,
        percent,
        ...tasks,
      ];
}

class AddSuccess extends TasksState {}

class AddFail extends TasksState {
  final String error;

  const AddFail(this.error);

  @override
  List<Object> get props => [
        UniqueKey(),
        error,
      ];
}
