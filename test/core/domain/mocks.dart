import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:semantics_label_study_case/core/domain/entities/user_entity.dart';
import 'package:semantics_label_study_case/core/domain/repositories/storage_repository.dart';

class MockStorageRepository extends Mock implements StorageRepository {}

final UserEntity userEntity = UserEntity(
  email: faker.internet.email(),
  password: faker.internet.password(),
  name: faker.person.name(),
);
