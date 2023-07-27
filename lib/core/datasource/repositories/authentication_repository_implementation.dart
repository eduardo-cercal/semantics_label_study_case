import 'package:semantics_label_study_case/core/datasource/data/authentication/authentication_datasource.dart';
import 'package:semantics_label_study_case/core/datasource/models/credentials_model.dart';
import 'package:semantics_label_study_case/core/domain/entities/credentials_entity.dart';
import 'package:semantics_label_study_case/core/domain/repositories/authentication_repository.dart';
import 'package:semantics_label_study_case/core/utils/exception.dart';
import 'package:semantics_label_study_case/core/utils/failure.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final AuthenticationDataSource dataSource;

  AuthenticationRepositoryImplementation(this.dataSource);

  @override
  Future<void> auth(CredentialsEntity? credentialsEntity) async {
    try {
      await dataSource.auth(CredentialsModel.fromEntity(credentialsEntity!));
    } on InvalidCredentialsException {
      throw InvalidCredentialsFailure();
    } on UnregisterUserException {
      throw UnresgiterUserFailure();
    }
  }
}
