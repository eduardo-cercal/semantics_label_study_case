import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:semantics_label_study_case/core/domain/repositories/storage_repository.dart';
import 'package:semantics_label_study_case/core/domain/usecases/save_user_usecase.dart';

import '../mocks.dart';

void main() {
  late StorageRepository repository;
  late SaveUserUseCase useCase;

  setUp(() {
    repository = MockStorageRepository();
    useCase = SaveUserUseCase(repository);
    registerFallbackValue(userEntity);
  });

  test('should save the user when call the method', () async {
    when(() => repository.save(any())).thenAnswer((_) async {});

    await useCase(userEntity);

    verify(() => repository.save(userEntity)).called(1);
  });
}
