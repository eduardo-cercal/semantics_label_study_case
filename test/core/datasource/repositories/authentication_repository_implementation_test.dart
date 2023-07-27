import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:semantics_label_study_case/core/datasource/data/authentication/authentication_datasource.dart';
import 'package:semantics_label_study_case/core/datasource/models/credentials_model.dart';
import 'package:semantics_label_study_case/core/datasource/repositories/authentication_repository_implementation.dart';
import 'package:semantics_label_study_case/core/domain/repositories/authentication_repository.dart';
import 'package:semantics_label_study_case/core/utils/exception.dart';
import 'package:semantics_label_study_case/core/utils/failure.dart';

class MockAuthenticationDataSource extends Mock
    implements AuthenticationDataSource {}

void main() {
  late AuthenticationDataSource dataSource;
  late AuthenticationRepository repository;
  late CredentialsModel credentialsModel;

  CredentialsModel mockCredentials() => CredentialsModel(
        email: faker.internet.email(),
        password: faker.internet.password(),
      );

  When mockDataSourceCall() => when(() => dataSource.auth(any()));

  void mockDataSource() => mockDataSourceCall().thenAnswer((_) async {});

  void mockDataSourceError(Exception exception) =>
      mockDataSourceCall().thenThrow(exception);

  setUp(() {
    dataSource = MockAuthenticationDataSource();
    repository = AuthenticationRepositoryImplementation(dataSource);
    credentialsModel = mockCredentials();
    registerFallbackValue(credentialsModel);
    mockDataSource();
  });

  test('should authenticate the user when giver a valid credentials model',
      () async {
    await repository.auth(credentialsModel);

    verify(() => dataSource.auth(credentialsModel)).called(1);
  });

  test(
      'should throw an InvalidCredentialsException when gives a invalid CredentialsModel',
      () async {
    mockDataSourceError(InvalidCredentialsException());

    final error = repository.auth(credentialsModel);

    expect(error, throwsA(InvalidCredentialsFailure()));
  });

  test('should throw an UnresgiterUserException when gives an unregister user',
      () async {
    mockDataSourceError(UnregisterUserException());

    final error = repository.auth(credentialsModel);

    expect(error, throwsA(UnresgiterUserFailure()));
  });
}
