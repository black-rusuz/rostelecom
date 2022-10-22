import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final int userId;

  const NoteModel({
    required this.id,
    required this.name,
    required this.description,
    required this.userId,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'] ?? 0,
      name: json['name'],
      description: json['description'],
      userId: json['userId'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        userId,
      ];
}
