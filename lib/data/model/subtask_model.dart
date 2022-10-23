import 'package:equatable/equatable.dart';

import 'task_model.dart';

class SubtaskModel extends Equatable {
  final int taskId;
  final String name;
  final TaskStatus status;

  const SubtaskModel({
    required this.taskId,
    required this.name,
    required this.status,
  });

  factory SubtaskModel.fromJson(Map<String, dynamic> json) {
    return SubtaskModel(
      taskId: json['task_id'],
      name: json['name'],
      status: TaskStatus.fromString(json['status']),
    );
  }

  Map<String, dynamic> toJson() => {
        'task_id': taskId,
        'name': name,
        'status': status.value,
      };

  @override
  List<Object?> get props => [
        taskId,
        name,
        status,
      ];
}
