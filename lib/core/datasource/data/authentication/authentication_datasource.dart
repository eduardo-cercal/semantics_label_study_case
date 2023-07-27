import 'package:semantics_label_study_case/core/datasource/models/credentials_model.dart';

abstract class AuthenticationDataSource {
  Future<void> auth(CredentialsModel credentialsModel);
}
