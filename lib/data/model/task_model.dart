import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';
import '../utils.dart';
import 'subtask_model.dart';
import 'user_model.dart';

class TaskModel extends Equatable {
  final int id;
  final String name;
  final String? description;
  final TaskDuration duration;
  final DateTime endTime;
  final TaskStatus status;
  final bool isHidden;
  final UserModel? master;
  final UserModel slave;
  final List<SubtaskModel> subtasks;

  const TaskModel({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.endTime,
    required this.status,
    required this.isHidden,
    required this.master,
    required this.slave,
    required this.subtasks,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      duration: TaskDuration.fromString(json['term']),
      endTime: DateTime.parse(json['endTime']),
      status: TaskStatus.fromString(json['status']),
      isHidden: json['hidden'] > 0,
      master:
          json['master'] != null ? UserModel.fromJson(json['master']) : null,
      slave: UserModel.fromJson(json['user_id']),
      subtasks: (json['subtask'] as List)
          .map((e) => SubtaskModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'term': duration.value,
        'endTime': Utils.dateToJson(endTime),
        'userId': slave.id,
        'hidden': isHidden,
        'master': master?.id ?? 1,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        duration,
        endTime,
        status,
        isHidden,
        master,
        slave,
      ];

  bool get isHot => endTime.difference(DateTime.now()).inDays == 0;

  Color get color => isHot
      ? Styles.redColor
      : isHidden
          ? Styles.greyColor
          : Styles.accentColor;

  IconData get icon {
    switch (status) {
      case TaskStatus.notAssigned:
        return Icons.access_time;
      case TaskStatus.inWork:
        return Icons.loop_rounded;
      case TaskStatus.onReview:
        return Icons.edit;
      case TaskStatus.done:
        return Icons.check_rounded;
      case TaskStatus.undefined:
        return Icons.question_mark_rounded;
      default:
        return Icons.question_mark_rounded;
    }
  }

  Color get iconColor {
    switch (status) {
      case TaskStatus.notAssigned:
        return Styles.greyColor;
      case TaskStatus.inWork:
        return Styles.accentColor;
      case TaskStatus.onReview:
        return Styles.secondaryColor;
      case TaskStatus.done:
        return Styles.greenColor;
      case TaskStatus.undefined:
        return Styles.greyColor;
      default:
        return Styles.greyColor;
    }
  }
}

enum TaskDuration {
  day('День'),
  week('Неделя'),
  month('Месяц'),
  quarter('Квартал'),
  undefined('Период неопознан');

  const TaskDuration(this.value);

  final String value;

  factory TaskDuration.fromString(String data) {
    switch (data.toLowerCase()) {
      case 'день':
        return TaskDuration.day;
      case 'неделя':
        return TaskDuration.week;
      case 'месяц':
        return TaskDuration.month;
      case 'квартал':
        return TaskDuration.quarter;
    }
    return TaskDuration.undefined;
  }

  static List<TaskDuration> get list =>
      TaskDuration.values.sublist(0, TaskDuration.values.length - 1).toList();

  static List<String> get stringList => list.map((e) => e.value).toList();
}

enum TaskStatus {
  notAssigned('Не назначено'),
  inWork('В работе'),
  onReview('На проверке'),
  done('Готово'),
  undefined('Статус неопознан');

  const TaskStatus(this.value);

  final String value;

  factory TaskStatus.fromString(String data) {
    switch (data.toLowerCase()) {
      case 'не назначено':
        return TaskStatus.notAssigned;
      case 'в работе':
        return TaskStatus.inWork;
      case 'на проверке':
        return TaskStatus.onReview;
      case 'готово':
        return TaskStatus.done;
    }
    return TaskStatus.undefined;
  }

  static List<TaskStatus> get list =>
      TaskStatus.values.sublist(0, TaskStatus.values.length - 1).toList();

  static List<String> get stringList => list.map((e) => e.value).toList();
}
