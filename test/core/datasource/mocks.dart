import 'package:localstorage/localstorage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:semantics_label_study_case/core/datasource/data/storage/storage_datasource.dart';
import 'package:semantics_label_study_case/core/datasource/models/user_model.dart';

class MockStorageDataSource extends Mock implements StorageDataSource {}

class MockLocalStorage extends Mock implements LocalStorage {}

const UserModel userModel = UserModel(
  email: 'test@test.com',
  password: 'test123',
  name: 'test',
);
