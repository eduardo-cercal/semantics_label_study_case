import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:semantics_label_study_case/core/datasource/data/storage/local_storage_datasource.dart';
import 'package:semantics_label_study_case/core/datasource/data/storage/storage_datasource.dart';
import 'package:semantics_label_study_case/core/utils/exception.dart';

import '../../mocks.dart';

void main() {
  late LocalStorage localStorage;
  late StorageDataSource dataSource;
  late Map<String, dynamic> json;

  Map<String, dynamic> mockJson() => {
        'email': 'test@test.com',
        'password': 'test123',
        'name': 'test',
      };

  setUp(() {
    localStorage = MockLocalStorage();
    dataSource = LocalStorageDataSource(localStorage);
    json = mockJson();
  });

  group('fetch', () {
    void mockLocalSotrage(dynamic value) =>
        when(() => localStorage.getItem(any())).thenAnswer((_) async => value);
    test('should return a UserModel when returns a json', () async {
      mockLocalSotrage(json);

      final result = await dataSource.fetch();

      expect(result, userModel);

      verify(() => localStorage.getItem('user')).called(1);
    });

    test('should throw a UnregisterUserException when return null', () async {
      mockLocalSotrage(null);

      final error = dataSource.fetch();

      expect(error, throwsA(UnregisterUserException()));
    });
  });

  group('save', () {
    test('should recieve the currecty json', () async {
      when(() => localStorage.setItem(any(), any())).thenAnswer((_) async {});

      await dataSource.save(userModel);

      verify(() => localStorage.setItem('user', jsonEncode(json))).called(1);
    });
  });
}
