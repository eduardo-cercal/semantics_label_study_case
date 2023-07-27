import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:semantics_label_study_case/core/datasource/data/storage/storage_datasource.dart';
import 'package:semantics_label_study_case/core/datasource/models/user_model.dart';
import 'package:semantics_label_study_case/core/utils/exception.dart';

class LocalStorageDataSource implements StorageDataSource {
  final LocalStorage localStorage;

  LocalStorageDataSource(this.localStorage);

  @override
  Future<UserModel> fetch() async {
    final response = await localStorage.getItem('user');

    if (response == null) throw UnregisterUserException();

    return UserModel.fromJson(response);
  }

  @override
  Future<void> save(UserModel userModel) async => localStorage.setItem(
        'user',
        jsonEncode(userModel.toJson()),
      );
}
