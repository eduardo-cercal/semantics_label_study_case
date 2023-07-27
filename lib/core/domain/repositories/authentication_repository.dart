import 'package:semantics_label_study_case/core/domain/entities/credentials_entity.dart';

abstract class AuthenticationRepository {
  Future<void> auth(CredentialsEntity? credentialsEntity);
}
