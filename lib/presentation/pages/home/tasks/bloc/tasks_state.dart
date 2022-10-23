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
  final int undone;
  final int hot;
  final int percent;
  final List<TaskModel> tasks;

  const TasksSuccess({
    required this.total,
    required this.assigned,
    required this.done,
    required this.undone,
    required this.hot,
    required this.percent,
    required this.tasks,
  });

  @override
  List<Object> get props => [
        total,
        assigned,
        done,
        undone,
        hot,
        percent,
        ...tasks,
      ];
}
