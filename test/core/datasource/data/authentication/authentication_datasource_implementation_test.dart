import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:semantics_label_study_case/core/datasource/data/authentication/authentication_datasource.dart';
import 'package:semantics_label_study_case/core/datasource/data/authentication/authentication_datasource_implementation.dart';
import 'package:semantics_label_study_case/core/datasource/data/storage/storage_datasource.dart';
import 'package:semantics_label_study_case/core/datasource/models/credentials_model.dart';
import 'package:semantics_label_study_case/core/utils/exception.dart';

import '../../mocks.dart';

void main() {
  late StorageDataSource storageDataSource;
  late AuthenticationDataSource authenticationDataSource;
  late CredentialsModel credentialsModel;

  CredentialsModel mockCredentialsModel() => const CredentialsModel(
        email: 'test@test.com',
        password: 'test123',
      );

  CredentialsModel mockCredentialsModelError() => CredentialsModel(
        email: faker.internet.email(),
        password: faker.internet.password(),
      );

  When mockStorageDataSourceCall() => when(() => storageDataSource.fetch());

  void mockStorageDataSource() =>
      mockStorageDataSourceCall().thenAnswer((_) async => userModel);

  setUp(() {
    storageDataSource = MockStorageDataSource();
    authenticationDataSource =
        AuthenticationDataSourceImplementation(storageDataSource);
    credentialsModel = mockCredentialsModel();
    mockStorageDataSource();
  });

  test('should authenticate the user', () async {
    await authenticationDataSource.auth(credentialsModel);

    verify(() => storageDataSource.fetch());
  });

  test(
      'should throw a InvalidCredentialsException when the credentials dont match',
      () async {
    mockStorageDataSourceCall().thenThrow(UnregisterUserException());

    final error = authenticationDataSource.auth(credentialsModel);

    expect(error, throwsA(UnregisterUserException()));
  });

  test(
      'should throw a InvalidCredentialsException when credentials are invalid',
      () async {
    credentialsModel = mockCredentialsModelError();
    final error = authenticationDataSource.auth(credentialsModel);

    expect(error, throwsA(InvalidCredentialsException()));
  });
}
