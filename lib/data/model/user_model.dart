import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String email;
  final String name;
  final String? phone;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        phone,
      ];
}
