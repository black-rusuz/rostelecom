import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? email;
  final String? name;
  final String? phone;

  const UserModel({
    this.id,
    this.email,
    this.name,
    this.phone,
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
