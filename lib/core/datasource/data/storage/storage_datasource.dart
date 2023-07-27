import 'package:semantics_label_study_case/core/datasource/models/user_model.dart';

abstract class StorageDataSource {
  Future<UserModel> fetch();

  Future<void> save(UserModel userModel);
}
