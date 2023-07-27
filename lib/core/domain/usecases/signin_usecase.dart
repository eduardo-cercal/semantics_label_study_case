import 'package:semantics_label_study_case/core/domain/entities/credentials_entity.dart';
import 'package:semantics_label_study_case/core/domain/repositories/authentication_repository.dart';
import 'package:semantics_label_study_case/core/domain/utils/usecase.dart';
import 'package:semantics_label_study_case/core/utils/failure.dart';

class SigninUseCase implements UseCase<void, CredentialsEntity> {
  final AuthenticationRepository repository;

  SigninUseCase(this.repository);

  @override
  Future<void> call([CredentialsEntity? credentialsEntity]) async {
    try {
      await repository.auth(credentialsEntity);
    } on InvalidCredentialsFailure {
      rethrow;
    } on UnresgiterUserFailure {
      rethrow;
    }
  }
}
