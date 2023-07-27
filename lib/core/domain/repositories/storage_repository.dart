import 'package:semantics_label_study_case/core/domain/entities/user_entity.dart';

abstract class StorageRepository {
  Future<UserEntity> fetch();

  Future<void> save(UserEntity userEntity);
}
