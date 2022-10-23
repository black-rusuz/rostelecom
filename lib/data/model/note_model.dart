import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final int userId;
  final String? imageUrl;

  const NoteModel({
    required this.id,
    required this.name,
    required this.description,
    required this.userId,
    this.imageUrl,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'] ?? 0,
      name: json['name'],
      description: json['description'],
      userId: json['user_id'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        userId,
        imageUrl,
      ];
}
