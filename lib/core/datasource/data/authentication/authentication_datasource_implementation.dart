import 'package:semantics_label_study_case/core/datasource/data/authentication/authentication_datasource.dart';
import 'package:semantics_label_study_case/core/datasource/data/storage/storage_datasource.dart';
import 'package:semantics_label_study_case/core/datasource/models/credentials_model.dart';
import 'package:semantics_label_study_case/core/utils/exception.dart';

class AuthenticationDataSourceImplementation
    implements AuthenticationDataSource {
  final StorageDataSource dataSource;

  AuthenticationDataSourceImplementation(this.dataSource);

  @override
  Future<void> auth(CredentialsModel credentialsModel) async {
    try {
      final user = await dataSource.fetch();
      if (credentialsModel.email != user.email ||
          credentialsModel.password != user.password) {
        throw InvalidCredentialsException();
      }
    } on UnregisterUserException {
      rethrow;
    }
  }
}
