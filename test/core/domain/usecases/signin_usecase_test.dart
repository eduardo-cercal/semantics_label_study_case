import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:semantics_label_study_case/core/domain/entities/credentials_entity.dart';
import 'package:semantics_label_study_case/core/domain/repositories/authentication_repository.dart';
import 'package:semantics_label_study_case/core/domain/usecases/signin_usecase.dart';
import 'package:semantics_label_study_case/core/utils/failure.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late AuthenticationRepository repository;
  late SigninUseCase useCase;
  late CredentialsEntity credentialsEntity;

  CredentialsEntity mockCredentials = CredentialsEntity(
    email: faker.internet.email(),
    password: faker.internet.password(),
  );

  When mockRepositoryCall() => when(() => repository.auth(any()));

  void mockRepository() => mockRepositoryCall().thenAnswer((_) async {});

  void mockRepositoryError(Failure failure) =>
      mockRepositoryCall().thenThrow(failure);

  setUp(() {
    repository = MockAuthenticationRepository();
    useCase = SigninUseCase(repository);
    credentialsEntity = mockCredentials;
    registerFallbackValue(credentialsEntity);
    mockRepository();
  });

  test('should authenticate the user when given a valid credential entity',
      () async {
    await useCase(credentialsEntity);

    verify(() => repository.auth(credentialsEntity)).called(1);
  });

  test(
      'should throw a InvalidCredentialsFailure when given a invalid credentials entity',
      () async {
    mockRepositoryError(InvalidCredentialsFailure());

    final error = useCase(credentialsEntity);

    expect(error, throwsA(InvalidCredentialsFailure()));
  });

  test('should throw a UnregisterUserFailure when dont have an user saved',
      () async {
    mockRepositoryError(UnresgiterUserFailure());

    final error = useCase(credentialsEntity);

    expect(error, throwsA(UnresgiterUserFailure()));
  });
}
