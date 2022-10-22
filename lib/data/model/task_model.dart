import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final int id;
  final String name;
  final String? description;
  final TaskDuration duration;
  final DateTime endTime;
  final TaskStatus status;
  final bool isHidden;
  final int masterId;
  final int? slaveId;

  const TaskModel({
    required this.id,
    required this.name,
    this.description,
    required this.duration,
    required this.endTime,
    required this.status,
    required this.isHidden,
    required this.masterId,
    this.slaveId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: int.parse(json['id']),
      name: json['name'],
      description: json['description'],
      duration: TaskDuration.fromString(json['term']),
      endTime: DateTime.parse(json['endTime']),
      status: TaskStatus.fromString(json['status']),
      isHidden: json['hidden'],
      masterId: int.parse(json['id']),
      slaveId: int.parse(json['user_id']),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'term': duration,
        'endTime': endTime,
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
        return TaskStatus.notAssigned;
      case 'В работе':
        return TaskStatus.inWork;
      case 'На проверке':
        return TaskStatus.onReview;
      case 'Готово':
        return TaskStatus.ready;
    }
    return TaskStatus.undefined;
  }
}
