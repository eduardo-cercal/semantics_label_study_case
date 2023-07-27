import 'package:semantics_label_study_case/core/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.email,
    required super.password,
    required super.name,
  });

  factory UserModel.fromEntity(UserEntity userEntity) => UserModel(
        email: userEntity.email,
        password: userEntity.password,
        name: userEntity.name,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        password: json['password'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'name': name,
      };
}
