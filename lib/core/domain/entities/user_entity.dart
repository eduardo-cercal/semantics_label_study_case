import 'package:semantics_label_study_case/core/domain/entities/credentials_entity.dart';

class UserEntity extends CredentialsEntity {
  final String name;

  const UserEntity({
    required super.email,
    required super.password,
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}
