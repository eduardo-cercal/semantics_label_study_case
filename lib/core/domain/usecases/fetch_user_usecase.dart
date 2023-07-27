import 'package:semantics_label_study_case/core/domain/entities/user_entity.dart';
import 'package:semantics_label_study_case/core/domain/repositories/storage_repository.dart';
import 'package:semantics_label_study_case/core/domain/utils/usecase.dart';
import 'package:semantics_label_study_case/core/utils/failure.dart';

class FetchUserUseCase implements UseCase<UserEntity, void> {
  final StorageRepository repository;

  FetchUserUseCase(this.repository);

  @override
  Future<UserEntity> call([void input]) async {
    try {
      return await repository.fetch();
    } on UnresgiterUserFailure {
      rethrow;
    }
  }
}
