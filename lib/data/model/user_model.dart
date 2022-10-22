import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String email;
  final String? name;
  final String? phone;

  const UserModel({
    required this.email,
    this.name,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  @override
  List<Object?> get props => [
        email,
        name,
        phone,
      ];
}
