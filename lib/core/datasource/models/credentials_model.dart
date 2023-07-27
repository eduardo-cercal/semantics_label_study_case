import 'package:semantics_label_study_case/core/domain/entities/credentials_entity.dart';

class CredentialsModel extends CredentialsEntity {
  const CredentialsModel({
    required super.email,
    required super.password,
  });

  factory CredentialsModel.fromEntity(CredentialsEntity credentialsEntity) =>
      CredentialsModel(
        email: credentialsEntity.email,
        password: credentialsEntity.password,
      );

  factory CredentialsModel.fromJson(Map<String, dynamic> json) =>
      CredentialsModel(
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
