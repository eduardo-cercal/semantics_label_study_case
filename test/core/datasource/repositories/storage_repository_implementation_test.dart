import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:semantics_label_study_case/core/datasource/data/storage/storage_datasource.dart';
import 'package:semantics_label_study_case/core/datasource/repositories/storage_repository_implementation.dart';
import 'package:semantics_label_study_case/core/domain/repositories/storage_repository.dart';
import 'package:semantics_label_study_case/core/utils/exception.dart';
import 'package:semantics_label_study_case/core/utils/failure.dart';

import '../mocks.dart';

void main() {
  late StorageDataSource dataSource;
  late StorageRepository repository;

  setUp(() {
    dataSource = MockStorageDataSource();
    repository = StorageRepositoryImplementation(dataSource);
    registerFallbackValue(userModel);
  });

  group('fetch', () {
    When mockDataSourceCall() => when(() => dataSource.fetch());

    test('should return a UserModel when call the datasource method', () async {
      mockDataSourceCall().thenAnswer((_) async => userModel);

      final result = await repository.fetch();

      expect(result, userModel);

      verify(() => dataSource.fetch()).called(1);
    });

    test(
        'should return a UnregisterUserFailure when throws a UnregisterUserException',
        () async {
      mockDataSourceCall().thenThrow(UnregisterUserException());

      final error = repository.fetch();

      expect(error, throwsA(UnresgiterUserFailure()));
    });
  });

  group('save', () {
    test('should save the user model when invoke the method', () async {
      when(() => dataSource.save(any())).thenAnswer((_) async {});

      await repository.save(userModel);

      verify(() => dataSource.save(userModel)).called(1);
    });
  });
}
