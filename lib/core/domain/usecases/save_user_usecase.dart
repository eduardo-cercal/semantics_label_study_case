import 'package:semantics_label_study_case/core/domain/entities/user_entity.dart';
import 'package:semantics_label_study_case/core/domain/repositories/storage_repository.dart';
import 'package:semantics_label_study_case/core/domain/utils/usecase.dart';

class SaveUserUseCase implements UseCase<void, UserEntity> {
  final StorageRepository repository;

  SaveUserUseCase(this.repository);

  @override
  Future<void> call([UserEntity? userEntity]) async =>
      await repository.save(userEntity!);
}
