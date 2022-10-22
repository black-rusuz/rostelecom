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
  final List<TaskModel> dayTasks;
  final List<TaskModel> weekTasks;
  final List<TaskModel> monthTasks;
  final List<TaskModel> quarterTasks;

  const TasksSuccess({
    required this.total,
    required this.assigned,
    required this.done,
    required this.percent,
    required this.dayTasks,
    required this.weekTasks,
    required this.monthTasks,
    required this.quarterTasks,
  });

  @override
  List<Object> get props => [
        total,
        assigned,
        done,
        percent,
        ...dayTasks,
        ...weekTasks,
        ...monthTasks,
        ...quarterTasks,
      ];
}
