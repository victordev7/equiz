import 'package:dartz/dartz.dart';
import 'package:equiz/modules/auth/domain/auth_failures.dart';
import 'package:equiz/modules/auth/domain/entities/user_entity.dart';
import 'package:equiz/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:equiz/modules/auth/domain/user_params.dart';
import 'package:equiz/modules/auth/infra/datasources/auth_datasource_interface.dart';
import 'package:equiz/modules/auth/infra/models/user_model.dart';
import 'package:equiz/modules/auth/infra/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([IAuthDatasource])
void main() {
  IAuthDatasource datasource = MockIAuthDatasource();
  IAuthRepository repository = AuthRepository(datasource);
  var params = UserParams(name: 'name', email: 'email', password: 'password');

  test('Deve retornar um UserEntity', () async {
    when(datasource.createAccount(params)).thenAnswer((_) async =>
        UserModel(email: params.email, name: params.name, uid: '12312e wqdf'));

    var response = await repository.createAccount(params);
    var user = response.fold(id, id) as UserEntity;

    expect(user, isA<UserEntity>());
    expect(user.name, params.name);
  });

  test('Deve retornar um AuthFailure caso o datasource lance uma exceção',
      () async {
    when(datasource.createAccount(params)).thenThrow(InvalidEmail());

    var response = await repository.createAccount(params);
    expect(response.fold(id, id), isA<AuthFailure>());
  });
}
