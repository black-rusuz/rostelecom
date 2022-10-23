import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';
import '../utils.dart';

class TaskModel extends Equatable {
  final int id;
  final String name;
  final String? description;
  final TaskDuration duration;
  final DateTime endTime;
  final TaskStatus status;
  final bool isHidden;
  final int? masterId;
  final int? slaveId;

  const TaskModel({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.endTime,
    required this.status,
    required this.isHidden,
    required this.masterId,
    required this.slaveId,
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
      // !! TODO masterId
      masterId: json['master_id'],
      slaveId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'term': duration.value,
        'endTime': Utils.dateToJson(endTime),
        'userId': slaveId,
        'hidden': isHidden,
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
        masterId,
        slaveId,
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
      case TaskStatus.ready:
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
      case TaskStatus.ready:
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
    switch (data) {
      case 'День':
        return TaskDuration.day;
      case 'Неделя':
        return TaskDuration.week;
      case 'Месяц':
        return TaskDuration.month;
      case 'Квартал':
        return TaskDuration.quarter;
    }
    return TaskDuration.undefined;
  }

  static List<String> get list => TaskDuration.values
      .sublist(0, TaskDuration.values.length - 1)
      .map((e) => e.value)
      .toList();
}

enum TaskStatus {
  notAssigned('Не назначено'),
  inWork('В работе'),
  onReview('На проверке'),
  ready('Готово'),
  undefined('Статус неопознан');

  const TaskStatus(this.value);

  final String value;

  factory TaskStatus.fromString(String data) {
    switch (data) {
      case 'Не назначено':
      case 'не назначено':
        return TaskStatus.notAssigned;
      case 'В работе':
      case 'в работе':
        return TaskStatus.inWork;
      case 'На проверке':
      case 'на проверке':
        return TaskStatus.onReview;
      case 'Готово':
      case 'готово':
        return TaskStatus.ready;
    }
    return TaskStatus.undefined;
  }

  static List<String> get list => TaskStatus.values
      .sublist(0, TaskStatus.values.length - 1)
      .map((e) => e.value)
      .toList();
}
