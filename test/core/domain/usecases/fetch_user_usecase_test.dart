import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:semantics_label_study_case/core/domain/repositories/storage_repository.dart';
import 'package:semantics_label_study_case/core/domain/usecases/fetch_user_usecase.dart';
import 'package:semantics_label_study_case/core/utils/failure.dart';

import '../mocks.dart';

void main() {
  late StorageRepository repository;
  late FetchUserUseCase useCase;

  When mockRepositoryCall() => when(() => repository.fetch());

  setUp(() {
    repository = MockStorageRepository();
    useCase = FetchUserUseCase(repository);
  });

  test('should return a userEntity when call the method', () async {
    mockRepositoryCall().thenAnswer((_) async => userEntity);

    final result = await useCase();

    expect(result, userEntity);

    verify(() => repository.fetch()).called(1);
  });

  test('should return UnresgiterUserFailure when dont have a register user',
      () async {
    mockRepositoryCall().thenThrow(UnresgiterUserFailure());

    final error = useCase();

    expect(error, throwsA(UnresgiterUserFailure()));
  });
}
