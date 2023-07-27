import 'package:semantics_label_study_case/core/datasource/data/storage/storage_datasource.dart';
import 'package:semantics_label_study_case/core/datasource/models/user_model.dart';
import 'package:semantics_label_study_case/core/domain/entities/user_entity.dart';
import 'package:semantics_label_study_case/core/domain/repositories/storage_repository.dart';
import 'package:semantics_label_study_case/core/utils/exception.dart';
import 'package:semantics_label_study_case/core/utils/failure.dart';

class StorageRepositoryImplementation implements StorageRepository {
  final StorageDataSource dataSource;

  StorageRepositoryImplementation(this.dataSource);

  @override
  Future<UserEntity> fetch() async {
    try {
      return await dataSource.fetch();
    } on UnregisterUserException {
      throw UnresgiterUserFailure();
    }
  }

  @override
  Future<void> save(UserEntity userEntity) async =>
      await dataSource.save(UserModel.fromEntity(userEntity));
}
